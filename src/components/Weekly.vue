<template>
  <div class="container">
    <div class="weekly-calendar mt-5">
      <div class="d-flex justify-center align-center title">
        WEEKLY SCHEDULE
      </div>
      <v-data-table-virtual
        :headers="headers"
        style="font-size: 13px"
        height="426"
        :items="sched"
        item-value="id"
        :header-props="{ style: 'font-size:14px;' }"
        :fixed-header="showForm"
        class="table"
        row="4"
      >
        <template #[`item.time`]="{ value }">
          <div class="mt-9 mb-9 time">
            <span>{{ value }}</span>
          </div>
        </template>

        <template #[`item.M`]="{ value }">
          <div class="M">
            <span>{{ value }}</span>
          </div>
        </template>

        <template #[`header.time`]>
          <div class="time">Time</div>
        </template>
      </v-data-table-virtual>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    showForm: Boolean,
  },
  data() {
    return {
      sched: [
        { time: "7:00AM - 10:00AM", M: "ABM C" },
        { time: "10:45AM - 01:45AM", W: "ABM C" },
        { time: "2:00PM - 05:00PM", F: "GAS B" },
        { time: "5:00PM - 08:00PM", W: "GAS K" },
      ],
      headers: [
        {
          title: "Time",
          align: "center",
          key: "time",
          sortable: false,
        },
        {
          title: "Monday",
          align: "center",
          key: "M",
          sortable: false,
        },
        { title: "Tuesday", align: "center", key: "T", sortable: false },
        { title: "Wednesday", align: "center", key: "W", sortable: false },
        { title: "Thursday", align: "center", key: "TH", sortable: false },
        { title: "Friday", align: "center", key: "F", sortable: false },
        { title: "Saturday", align: "center", key: "S", sortable: false },
      ],
    };
  },

  methods: {},
};
</script>
<style scoped>
.table {
  width: 100%;
  box-shadow: 2px 2px 15px 1px rgb(195, 193, 193);
}
.title {
  font-size: 35px;
  font-weight: 500;
  background: rgb(211, 58, 58);
  color: white;
}
.weekly-calendar {
  width: 70%;
}
.time {
  width: 70%;
}
.M {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 12vh;
}
</style>
