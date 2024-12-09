<template>
    <div class="statistic-container">
      <div
        v-for="item in dataToDisplay"
        :key="item.statist_id"
        class="container-box"
        :style="{ backgroundColor: item.color }"
      >
        <img :src="item.icon" />
        <div class="data">
          <p id="statistic-data" style="font-size: 45px; font-weight: 400">
            {{ item.data }}
          </p>
          <p style="font-size: 12px; font-weight: 450">{{ item.type }}</p>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  import axios from "axios";
  export default {
    data() {
      return {
        dataToDisplay: [
          {
            statist_id: 1,
            type: "Faculties",
            data: 0,
            icon: "https://cdn-icons-png.flaticon.com/512/2790/2790260.png",
            color: "#7caed2c6",
          },
          {
            statist_id: 0,
            type: "Learning Supervisor",
            data: 0,
            icon: "https://cdn-icons-png.flaticon.com/512/10455/10455354.png",
            color: "rgba(227, 213, 79, 0.42)",
          },
          {
            statist_id: 3,
            type: "Learning Facilitator",
            data: 0,
            icon: "https://cdn-icons-png.flaticon.com/512/10747/10747893.png",
            color: "rgba(213, 99, 99, 0.42)",
          },
        ],
      };
    },
    mounted() {
      this.fetchFacultyStatistic();
    },
    methods: {
      fetchFacultyStatistic() {
        axios
          .get(
            `http://localhost:3000/src/database/faculty.php?getFacultyStatistic`
          )
          .then((response) => {
            const result = response.data;
            this.dataToDisplay[0].data = result.statistic1;
            this.dataToDisplay[1].data = result.statistic2;
            this.dataToDisplay[2].data = result.statistic3;
          })
          .catch((error) => {
            console.error(error);
          });
      },
    },
  };
  </script>
  
  <style scoped>
  .statistic-container {
    height: 90px;
    display: flex;
    gap: 120px;
    justify-content: center;
  }
  .container-box {
    width: 280px;
    display: flex;
    align-items: center;
    box-shadow: 2px 2px 3px rgb(195, 193, 193);
  }
  .data {
    padding: 0;
  }
  .data p {
    line-height: 100%;
    margin-bottom: 0;
  }
  #statistic-data {
    letter-spacing: 1px;
    margin-bottom: 5px;
  }
  .container-box .data {
    color: rgb(49, 49, 49);
  }
  .container-box img {
    height: 60px;
    width: 60px;
    margin: 0 30px;
  }
  </style>
  