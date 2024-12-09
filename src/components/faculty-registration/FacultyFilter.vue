<template>
  <h6 style="margin-bottom: 15px; color: gray">FILTER BY:</h6>
  <div class="select-container">
    <v-select
      v-model="filter.status"
      single-line
      label="STATUS"
      :items="['ALL', 'ACTIVE', 'DEACTIVATED']"
      variant="solo"
      class="domain"
      density="compact"
    ></v-select>
    <v-radio-group
      v-model="filter.gender"
      class="d-flex justify-center gender"
      inline
    >
      <div class="d-flex gap-3">
        <v-radio label="All" value="All"></v-radio>
        <v-radio label="Male" value="M"></v-radio>
        <v-radio label="Female" value="F"></v-radio>
      </div>
    </v-radio-group>
    <v-text-field
      v-model="filter.search"
      prepend-inner-icon="mdi-magnify"
      label="Search by name"
      variant="solo-filled"
      class="search"
      density="compact"
      single-line
    ></v-text-field>
  </div>
</template>
<script>
export default {
  data() {
    return {
      filter: {
        gender: "All",
        status: null,
        search: "",
      },
    };
  },
  emits: ["handleFilterTable"],
  watch: {
    "filter.gender": "filterFacultyTable",
    "filter.status": "filterFacultyTable",
    "filter.search": "filterFacultyTable",
  },
  methods: {
    filterFacultyTable() {
      this.$emit("handleFilterTable", this.filter);
    },
  },
};
</script>

<style scoped>
.select-container {
  display: flex;
}
.select {
  max-width: 400px;
}
.domain {
  max-width: 300px;
  margin-left: 20px;
}
.search {
  margin-left: 100px;
}
.gender{
  width: 120px;
}
</style>
