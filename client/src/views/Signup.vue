<template>
  <div align="center" style="height: 80vh">
    <div class="loginContainer">
      <h3 class="loginHeader">Sign Up and Start Learning!</h3>

      <div>
        <el-button @click="handleClickLoginGoogle" style="width: 100%"
          ><img style="max-width: 32px; max-height: 32px; margin-right: 5px" src="@/assets/google-logo.png" />Sign up
          with google</el-button
        >
      </div>

      <!-- START SIGNUP FORM -->
      <el-form @submit.prevent="handleSignup" status-icon :model="signupForm" :rules="rules" ref="signupFormRef">
        <el-form-item style="margin-top: 10px" prop="fullname" required>
          <el-input
            placeholder="Name"
            v-model="signupForm.fullname"
            :prefix-icon="User"
            maxlength="70"
            class="field"
            clearable
          >
          </el-input>
        </el-form-item>

        <el-form-item prop="email" required>
          <el-input
            placeholder="E-mail"
            v-model.trim="signupForm.email"
            maxlength="70"
            :prefix-icon="Message"
            class="field"
            type="email"
            clearable
          ></el-input>
        </el-form-item>

        <el-form-item prop="password" required>
          <el-input
            type="password"
            placeholder="Password"
            v-model.trim="signupForm.password"
            :prefix-icon="Lock"
            maxlength="80"
            class="field"
            show-password
          ></el-input>
        </el-form-item>

        <el-form-item prop="confirmPass" required>
          <el-input
            placeholder="Re-Enter Password"
            v-model.trim="signupForm.confirmPass"
            :prefix-icon="Lock"
            maxlength="80"
            class="field"
            show-password
          ></el-input>
        </el-form-item>

        <!--  CAPTCHA BOX -->
        <!--        <el-form-item>
          <vue-hcaptcha ref="myCaptcha" :sitekey="HCAPTCHA_KEY" @verify="handleVerify"></vue-hcaptcha>
        </el-form-item>-->

        <el-form-item style="margin-top: 8px">
          <el-button class="btn purple" style="font-weight: bold" :loading="isLoading" native-type="submit">
            Sign Up
          </el-button>
        </el-form-item>
      </el-form>

      <div style="margin-top: 13px">
        Already have an account?
        <router-link to="/login" style="font-weight: 800"> LogIn </router-link>
      </div>
    </div>
  </div>
</template>

<script lang="ts" setup>
import AuthService from "@/service/AuthService";
import { ElMessage } from "element-plus";
import type { FormInstance, FormRules } from "element-plus";
import { Lock, User, Message } from "@element-plus/icons-vue";
import { computed, onBeforeUnmount, onMounted, reactive, ref } from "vue";
import { handleApiError } from "@/util/http_util";
import { useRouter } from "vue-router";
// import VueHcaptcha from "@hcaptcha/vue3-hcaptcha";

document.title = "SignUp | Online Learning";

const signupFormRef = ref<FormInstance>();
const router = useRouter();
const responseToken = ref("");
// const myCaptcha = ref<VueHcaptcha>();

/* validation for fullname */
const checkName = (rule: any, value: string, callback: (arg?: Error) => void) => {
  const reg = /[^ \p{Han}0-9a-zA-Z_.'-]/i;
  if (!value) {
    return callback(new Error("Name can't be empty"));
  }
  setTimeout(() => {
    if (value.length < 2) {
      callback(new Error("Name is too short"));
    } else if (reg.test(signupForm.fullname)) {
      callback(new Error("Name contains illegal characters"));
    } else {
      callback();
    }
  }, 100);
};

// validation for password
const checkPassword = (rule: any, value: string, callback: (arg?: Error) => void) => {
  const passwordReg = /^(?=.*[0-9])(?=.*[a-zA-Z]).*([a-zA-Z0-9]+?)?$/gi;
  if (!value) {
    callback(new Error("Password can't be empty"));
  } else if (value.length < 8) {
    return callback(new Error("Minimum length is 8 characters"));
  } else if (!passwordReg.test(value)) {
    callback(new Error("Required at least 1 digit and 1 letter"));
  } else {
    callback();
  }
};

// validation for confirm password
const checkRepeatPass = (rule: any, value: string, callback: (arg?: Error) => void) => {
  if (!value) {
    callback(new Error("Re-enter the password"));
  } else if (value !== signupForm.password) {
    callback(new Error("Passwords don't match!"));
  } else {
    callback();
  }
};

const signupForm = reactive({
  fullname: "",
  email: "",
  password: "",
  confirmPass: ""
});

// rules for the validation
const rules = reactive<FormRules>({
  fullname: [{ validator: checkName, trigger: "blur" }],
  email: [{ required: true, type: "email", trigger: "blur" }],
  password: [{ validator: checkPassword, trigger: "blur" }],
  confirmPass: [{ validator: checkRepeatPass, trigger: "blur" }]
});

const isLoading = ref(false);

const handleClickLoginGoogle = (e: any) => {
  e.preventDefault();
  e.stopPropagation();
  window.location.href = import.meta.env.VITE_APP_BACKEND_ROOT_URL + "/oauth2/authorization/google";
};

function handleSignup() {
  signupFormRef.value?.validate(valid => {
    if (!valid) return;
    isLoading.value = true;
    submitToServer(signupForm)
      .then(() => redirectToLogin())
      .catch(err => displayError(err))
      .finally(() => (isLoading.value = false));
  });
}

function displayError(err: unknown) {
  handleApiError(err);
  // setTimeout(() => {
  //   resetCaptcha();
  // }, 200);
}

// function resetCaptcha() {
//   responseToken.value = "";
//   mycaptcha.value?.reset();
// }

const submitToServer = async (payload: typeof signupForm) => {
  await AuthService.registerUser({ ...payload }, responseToken.value);
};

function redirectToLogin() {
  ElMessage.success("Welcome to Online Learning. Please Login");
  setTimeout(() => {
    router.replace("/login");
    window.location.reload();
  }, 500);
}
</script>

<style>
.loginHeader {
  border-bottom: solid 1px #d1d7dc;
  color: #1c1d1f;
  display: block;
  font-weight: 700;
  padding: 24px 64px 24px 24px;
}

.loginContainer {
  color: #1c1d1f;
  width: 380px;
  text-align: center;
}

@media screen and (max-width: 600px) {
  .loginContainer {
    width: 250px;
  }
}
</style>
