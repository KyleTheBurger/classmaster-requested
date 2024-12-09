<template>
  <div class="summary-container">
    <div class="d-flex mt-2 justify-center header">
      <h4 style="color: #494949">COHORT</h4>
      <!-- <v-btn variant="outlined">NEW COHORT</v-btn> -->
    </div>
    <div class="d-flex flex-column cohort-container">
      <v-list density="compact" nav>
        <v-list-item
          v-for="item in cohorts"
          :key="item.cohort_id"
          :style="{ backgroundColor: getColor(item.cohort_name) }"
          :to="
            '/section-and-cohort-management/cohort/cohort-assingment/' +
            item.cohort_name
          "
          class="item-border"
        >
          <div class="d-flex align-center item-container justify-space-between">
            <div class="cohort-info flex-column">
              <p class="cohort-name">{{ item.cohort_name }}</p>
              <p class="cohort-supervisor">{{ item.learning_supervisor }}</p>
            </div>
            <h6>
              {{
                item.learning_facilitator?.length ?? 0
                  ? item.learning_facilitator.length + "/6"
                  : "0/6"
              }}
            </h6>
          </div>
        </v-list-item>
      </v-list>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      cohorts: [],
    };
  },
  mounted() {
    this.fetchCohortStatus();
  },
  methods: {
    fetchCohortStatus() {
      axios
        .get(`http://localhost:3000/src/database/cohort.php`)
        .then((response) => {
          this.cohorts = response.data;
        })
        .catch((error) => {
          console.error(error);
        });
    },
    getColor(strand) {
      switch (strand) {
        case "ABM":
          return "#BEF3B5";
        case "STEM 11":
          return "#F3EDB5";
        case "STEM 12":
          return "#E4DA78";
        case "GAS":
          return "#EDBDBD";
        case "TVL":
          return "#B5CAF3";
        default:
          return "rgba(207, 207, 207, 0.393)";
      }
    },
  },
};
</script>

<style scoped>
.item-container {
  justify-content: space-between;
  width: 100%;
  padding: 5px;
}
.item-container p {
  margin: 0;
}
.item-container h6 {
  margin: 0;
  margin-right: 5px;
}
.cohort-supervisor {
  font-size: small;
  color: rgb(84, 84, 84);
}
.cohort-name {
  font-weight: 600;
  color: rgb(46, 46, 46);
}
.v-list {
  width: 100%;
}
.v-list-item {
  margin: 10px 0;
  width: 100%;
  height: 70px;
  cursor: pointer;
  transition: 0.3s ease;
}
.v-list-item:hover {
  filter: brightness(1.05);
  font-size: 18px;
  transform: scale(1.03);
}
.header {
  gap: 40px;
  height: 45px;
  margin: 0px;
  width: 100%;
  border-bottom: 2px solid maroon;
  background: white;
  padding-bottom: 10px;
}
.header .v-btn {
  height: 30px;
  width: 120px;
  margin-right: 15px;
}
.summary-container {
  padding: 10px 15px 20px 15px;
  border: 1px solid rgb(222, 220, 220);
  border-radius: 3px;
  box-shadow: 5px 5px 3px rgb(212, 212, 212);
  width: 320px;
  height: 460px;
  display: flex;
  flex-direction: column;
}
.cohort-container {
  width: 100%;
  overflow-y: auto;
  flex-grow: 1;
}
</style>
