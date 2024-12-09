<template>
  <h6 style="margin-bottom: 15px; color: gray">FILTER BY:</h6>
  <div class="d-flex justify-space-between select-container">
    <v-select
      v-model="filter.domain"
      single-line
      label="DOMAIN TYPE"
      :items="[
        'ALL',
        'ENGLISH',
        'MATH',
        'SCI-TECH',
        'SPECIALIZATION',
        'P.E',
        'FILIPNO',
      ]"
      variant="solo"
      class="select"
      density="compact"
    ></v-select>
    <v-radio-group v-model="filter.subject_lvl" class="academic" inline>
      <v-radio label="All" value="All"></v-radio>
      <v-radio label="Grade 11" value="11"></v-radio>
      <v-radio label="Grade 12" value="12"></v-radio>
    </v-radio-group>
    <v-checkbox
      v-model="filter.otherDetail"
      label="Show other details"
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
        domain: null,
        subject_lvl: "All",
        otherDetail: false,
        search: "",
      },
    };
  },
  emits: ["handleSubjectTable"],
  watch: {
    "filter.domain": "filterSubjectTable",
    "filter.subject_lvl": "filterSubjectTable",
    "filter.otherDetail": "filterSubjectTable",
    "filter.search": "filterSubjectTable",
  },
  methods: {
    filterSubjectTable() {
      this.$emit("handleSubjectTable", this.filter);
    },
  },
};
</script>
<style scoped>
.academic {
  max-width: 280px;
  padding-top: 5px;
}
.select-container {
  display: flex;
}
.select {
  max-width: 200px;
}
.domain {
  max-width: 300px;
  margin-left: 20px;
}
.search {
  margin-left: 100px;
  max-width: 300px;
  max-height: 40px;
}
</style>
