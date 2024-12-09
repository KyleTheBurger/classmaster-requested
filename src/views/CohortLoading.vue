<template>
  <div class="container">
    <div class="statistic">
      <cohort-loading-statistic />
    </div>
    <div class="d-flex table-summary-container">
      <div class="cohort-table">
        <CohortLoadingFilter @handle-filter-cohort="onHandleFilterCohort" />
        <CohortLoadingTable :data="cohortloadingData" />
      </div>
      <div class="cohort-report">
        <cohort-summary />
      </div>
    </div>
  </div>
</template>
<script>
import axios from "axios";
import CohortLoadingFilter from "@/components/cohort-loading/CohortLoadingFilter.vue";
import CohortLoadingTable from "@/components/cohort-loading/CohortLoadingTable.vue";
import CohortLoadingStatistic from "@/components/cohort-loading/CohortLoadingStatistic.vue";
import CohortSummary from "@/components/cohort-loading/CohortSummary.vue";
export default {
  data() {
    return {
      cohortloadingData: [],
    };
  },
  components: {
    CohortLoadingTable,
    CohortLoadingStatistic,
    CohortSummary,
    CohortLoadingFilter,
  },
  mounted() {
    this.fetchFacultyData();
  },
  methods: {
    fetchFacultyData() {
      axios
        .get(`http://localhost:3000/src/database/cohortloading.php?`)
        .then((response) => {
          console.log(response.data);
          this.cohortloadingData = response.data;
        })
        .catch((error) => {
          console.error(error);
        });
    },
    onHandleFilterCohort(filter) {
      console.log(filter);
      axios
        .get("http://localhost:3000/src/database/cohortloading.php", {
          params: {
            filterCohortLoadingTable: true, // 1
            cohort_name: filter.cohort, //2
            availability: filter.availability,
            name: filter.search,
          },
        })
        .then((response) => {
          this.cohortloadingData = response.data;
        })
        .catch((error) => {
          console.error(error);
        });
    },
  },
};
</script>

<style scoped>
.statistic {
  margin: 5px 0 40px 0;
}
.table-summary-container {
  display: flex;
  max-height: 460px;
  gap: 50px;
}
.cohort-table {
  width: 100%;
  padding: 20px 15px;
  border: 1px solid rgb(222, 220, 220);
  border-radius: 3px;
  box-shadow: 5px 5px 3px rgb(212, 212, 212);
}
h1 span {
  margin-left: 10px;
}
.container {
  width: 100%;
  padding: 20px;
}
</style>
