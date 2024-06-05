package com.utc2.onlinelearning.repository;

import com.utc2.onlinelearning.dto.UserDTO;
import com.utc2.onlinelearning.models.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends CrudRepository<User, Integer> {

    Optional<User> findByEmail(String email);

    @Query("SELECT new com.utc2.onlinelearning.dto.UserDTO(id, fullname, email, createdAt) FROM User WHERE id = ?1")
    Optional<UserDTO> findUserDTObyId(Integer id);

}
