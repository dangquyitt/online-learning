<template>
  <div align="center" style="height: 80vh">
    <div class="loginContainer">
      <h3 class="loginHeader">Login to your Online Learning Account</h3>

      <div>
        <el-button @click="handleClickLoginGoogle" style="width: 100%"
          ><img style="max-width: 32px; max-height: 32px; margin-right: 5px" src="@/assets/google-logo.png" /> Login
          with google</el-button
        >
      </div>

      <!-- START LOGIN FORM BELOW -->
      <el-form @submit.prevent="handleLogin" status-icon :model="loginForm" :rules="rules" ref="loginFormRef">
        <el-form-item style="margin-top: 10px" prop="email">
          <el-input
            type="email"
            :prefix-icon="Message"
            placeholder="E-mail"
            maxlength="70"
            v-model.trim="loginForm.email"
            class="field"
            clearable
          ></el-input>
        </el-form-item>

        <el-form-item prop="password">
          <el-input
            placeholder="Password"
            :prefix-icon="Lock"
            v-model.trim="loginForm.password"
            class="field"
            show-password
          ></el-input>
        </el-form-item>

        <!--  CAPTCHA BOX -->
        <!--        <el-form-item>
          <vue-hcaptcha
            ref="mycaptcha"
            :sitekey="HCAPTCHA_KEY"
            @verify="handleVerify"
          ></vue-hcaptcha>
        </el-form-item>-->

        <div style="margin-top: 8px">
          <el-button class="btn purple" style="font-weight: bold" native-type="submit" :loading="isLoading">
            Log in
          </el-button>
        </div>
      </el-form>
      <!-- END FORM -->

      <div style="margin-top: 13px">
        New user?
        <router-link to="/signup" class="none" style="font-weight: 800"> Create an Account </router-link>
      </div>
    </div>
  </div>
</template>

<script lang="ts" setup>
import AuthService from "@/service/AuthService";
import { ElMessage } from "element-plus";
import { Lock, Message } from "@element-plus/icons-vue";
import { computed, onBeforeUnmount, onMounted, reactive, ref } from "vue";
import { handleApiError } from "@/util/http_util";
import type { FormInstance, FormRules } from "element-plus";
import { useStudentStore } from "@/stores";
import type { LoginRequest, UserDto } from "@/interfaces/custom";

document.title = "Login | Online Learning";

const loginFormRef = ref<FormInstance>();
const store = useStudentStore();

// validation for password
const checkPassword = (rule: any, value: string, callback: (arg?: Error) => void) => {
  if (!value) {
    callback(new Error("Password can't be empty"));
  } else {
    callback();
  }
};

const loginForm = reactive({
  email: "",
  password: "",
  responseToken: ""
});

// rules for the validation
const rules = reactive<FormRules>({
  email: [{ required: true, type: "email", trigger: "blur" }],
  password: [{ validator: checkPassword, trigger: "blur" }]
});

const isLoading = ref(false);

const handleClickLoginGoogle = (e: any) => {
  e.preventDefault();
  e.stopPropagation();
  window.location.href = import.meta.env.VITE_APP_BACKEND_ROOT_URL + "/oauth2/authorization/google";
};

//const HCAPTCHA_KEY = import.meta.env.VITE_APP_HCAPTCHA_CLIENT_KEY,

/** on formSubmit */
async function handleLogin() {
  const isValid = await loginFormRef.value?.validate();
  if (!isValid) return;
  isLoading.value = true;
  submitToServer(loginForm)
    .then(() => redirectToHome())
    .catch(error => displayError(error))
    .finally(() => (isLoading.value = false));
}

async function submitToServer(payload: LoginRequest) {
  const res = await AuthService.loginUser({ ...payload });
  const user: UserDto = res.data.userInfo;
  store.$patch({
    id: user.id,
    fullname: user.fullname,
    loggedIn: true
  });
  await store.getLoginStatus();
  await store.getCartCountServer();
}

function redirectToHome() {
  ElMessage.success("Welcome back!");
  window.location.replace("/");
}

/** onSuccess captcha solve */
// function handleVerify(token: string) {
//   loginForm.responseToken = token;
// }

function displayError(err: any) {
  handleApiError(err);
  setTimeout(() => {
    resetCaptcha();
  }, 200);
}

function resetCaptcha() {
  loginForm.responseToken = "";
  //this.$refs.mycaptcha.reset();
}
</script>

<style scoped>
.loginHeader {
  border-bottom: solid 1px #d1d7dc;
  color: var(--color-text);
  display: block;
  font-weight: 700;
  padding: 24px 64px 24px 24px;
}

.loginContainer {
  color: var(--color-text);
  width: 380px;
  text-align: center;
}

@media screen and (max-width: 600px) {
  .loginContainer {
    width: 250px;
  }
}
</style>
