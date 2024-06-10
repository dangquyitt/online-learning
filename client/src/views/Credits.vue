<template>
  <h2 class="cart-header">Credits</h2>
  <div class="main-view" style="height: 70vh">
    <h3>Course Content</h3>
    <p>All of the videos featured in this Demo are from the following YouTube channels</p>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";

export default defineComponent({
  name: "Credits",
  setup() {
    document.title = "Credits | Online Learning";
    return {};
  }
});
</script>

<style scoped></style>
