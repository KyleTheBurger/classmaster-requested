<template>
  <div class="form-container">
    <div class="d-flex justify-center align-center title">CREATE COHORT</div>
    <div class="form">
      <v-label style="margin-bottom: 10px">Cohort Name</v-label>
      <v-text-field
        label="Enter Cohort Name here"
        required
        class="domain"
        variant="outlined"
        single-line
        density="compact"
        :style="{ width: '300px' }"
      ></v-text-field>
      <v-label style="margin-bottom: 10px">Description: </v-label>
      <v-textarea
        label="Description"
        variant="outlined"
        no-resize
        :model-value="value"
        :rules="rules"
        single-line
      ></v-textarea>

      <!-- Button -->
      <div class="d-flex justify-end gap-4 mt-3 buttons">
        <v-btn variant="compact" @click="toggleForm">CLOSE</v-btn>
        <v-btn variant="compact">ADD</v-btn>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    showForm: Boolean,
  },
  data() {
    return {};
  },
  methods: {
    toggleForm() {
      this.$emit("closeForm");
    },
  },
};
</script>

<style>
.form-container {
  display: flex;
  flex-direction: column;
  height: 60vh;
  width: 100%;
  background: rgb(255, 255, 255);
  box-shadow: 3px 3px 20px 2px rgb(195, 193, 193);
}
.form {
  padding: 15px 30px;
}
.form-container .title {
  color: rgb(255, 255, 255);
  background: rgb(226, 96, 96);
  width: 100%;
  height: 50px;
  letter-spacing: 2px;
}
</style>
