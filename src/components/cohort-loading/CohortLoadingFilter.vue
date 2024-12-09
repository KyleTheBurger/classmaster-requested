<template>
  <h6 style="margin-bottom: 15px; color: gray">FILTER BY:</h6>
  <div class="select-container">
    <v-select
      v-model="filter.cohort"
      single-line
      label="SELECT COHORT"
      :items="['ABM', 'GAS', 'STEM 11', 'STEM 12', 'TVL']"
      variant="solo"
      class="select"
      density="compact"
    ></v-select>
    <v-checkbox
      v-model="filter.availability"
      label="Show available"
      variant="solo"
      class="domain"
      density="compact"
    ></v-checkbox>
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
        cohort: "ABM",
        availability: false,
        search: "",
      },
    };
  },
  emits: ["handle-filter-cohort"],
  watch: {
    "filter.cohort": "filterCohortLoadingTable",
    "filter.availability": "filterCohortLoadingTable",
    "filter.search": "filterCohortLoadingTable",
  },
  methods: {
    filterCohortLoadingTable() {
      this.$emit("handle-filter-cohort", this.filter);
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
</style>
