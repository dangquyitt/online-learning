package com.utc2.onlinelearning.service;

import com.utc2.onlinelearning.models.AuthProvider;
import com.utc2.onlinelearning.models.CustomOAuthUser;
import com.utc2.onlinelearning.models.User;
import com.utc2.onlinelearning.models.UserRole;
import com.utc2.onlinelearning.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import javax.validation.constraints.NotNull;
import java.util.Optional;


@Service
public class MyUserDetailsService implements UserDetailsService {

    public static final String USERID = "USER_ID";

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepository.findByEmail(username)
                .orElseThrow(() -> new UsernameNotFoundException("Not found"));
    }

    /**
     * Checks if Google-User exists in dB. If not, register as new user.
     * Else just login with new Session.
     *
     * @param oidcUser User logged in by Google
     * @param session  logged-in session
     */
    public void processOAuthPostLogin(OidcUser oidcUser, HttpSession session) {
        CustomOAuthUser m = new CustomOAuthUser(oidcUser);
        Optional<User> existUser = userRepository.findByEmail(m.getEmail());

        if (existUser.isEmpty()) {
            User newUser = new User();
            newUser.setFullname(m.getName());
            newUser.setEmail(m.getEmail());
            newUser.setConfirmPass("WHATEVER!"); //<-- anything, but not NULL
            newUser.setAuthProvider(AuthProvider.GOOGLE);
            newUser.setUserRole(UserRole.ROLE_STUDENT);

            userRepository.save(newUser);
            session.setAttribute(USERID, newUser.getId());
            return;
        }
        Integer userId = existUser.get().getId();
        session.setAttribute(USERID, userId);

    }


    /**
     * Just return the user_id saved in Redis Store
     *
     * @param session session
     * @return userId
     */
    public static Integer getSessionUserId(@NotNull HttpSession session) {
        return (Integer) session.getAttribute(USERID);
    }

}
