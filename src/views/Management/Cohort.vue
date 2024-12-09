<template>
  <div class="container">
    <div class="cohort-statistic mt-5">
      <CohortStatistic />
    </div>
    <div class="d-flex mt-10 mb-5 cohort-list-header">
      <v-label class="text-h5 font-weight-bold">COHORT LIST</v-label>
      <v-btn class="ml-10" color="rgba(67, 189, 94, 1)" @click="show = true">
        <span class="material-symbols-outlined mr-2"> add_circle </span>ADD COHORT
      </v-btn>
    </div>
    <div class="d-flex cohort-list">
      <CohortList :cohortList="cohortList" />
    </div>
  </div>
  <div v-if="show" class="cohort-form">
    <CohortForm @closeForm="show = false" />
  </div>
</template>
<script>
import axios from "axios";
import CohortStatistic from "@/components/cohort/CohortStatistic.vue";
import CohortList from "@/components/cohort/CohortList.vue";
import CohortForm from "@/components/cohort/CohortForm.vue";
export default {
  data() {
    return {
      cohortList: [],
      show: false,
    };
  },
  components: {
    CohortStatistic,
    CohortList,
    CohortForm,
  },
  mounted() {
    this.fetchCohortList();
  },

  methods: {
    fetchCohortList() {
      axios
        .get(`http://localhost:3000/src/database/cohort.php`)
        .then((response) => {
          this.cohortList = response.data.map((cohort) => ({
            ...cohort,
            show: false,
          }));
        })
        .catch((error) => {
          console.error(error);
        });
    },
  },
};
</script>

<style>
.cohort-list {
  width: 100%;
  box-shadow: 2px 2px 10px 1px rgb(206, 206, 206);
  padding: 20px;
}
.cohort-form {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
</style>
