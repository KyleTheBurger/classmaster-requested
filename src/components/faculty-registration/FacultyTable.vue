<template>
  <div
    class="screen-overlay"
    v-if="showFacultyInfo"
    @click="showFacultyInfo = !showFacultyInfo"
  >
    <div class="info-dialog">
      <img :src="require('@/assets/template.png')" class="logo-img" />
    </div>
  </div>
  <v-data-table-virtual
    :headers="headers"
    :items="faculties"
    height="320"
    style="font-size: 13px"
    item-value="id"
    :fixed-header="!showFacultyInfo"
    :header-props="{ style: 'font-size:14px;' }"
  >
    <template #[`item.action`]="{ item }">
      <v-btn
        v-if="showViewInfo"
        color="primary"
        @click="viewInfo(item)"
        class="detail-btn"
      >
        <span class="material-symbols-outlined"> description </span>
      </v-btn>
      <v-btn
        v-if="!showViewInfo"
        color="rgba(227, 213, 79, 0.42)"
        @click="editInfo(item)"
        class="edit-btn"
      >
        <span class="material-symbols-outlined"> edit </span>
      </v-btn>
    </template>
    <template #[`item.status`]="{ value }">
      <v-chip :color="getStatus(value)">
        {{ value }}
      </v-chip>
    </template>
    <template #[`item.name`]="{ value }">
      <span class="bold-name">{{ value }}</span>
    </template>
    <template #[`item.sex`]="{ value }">
      <span>{{ value == "M" ? "Male" : "Female" }}</span>
    </template>
    <template #[`header.action`]="{ headers }">
      <thead>
        <tr>
          <th>
            <v-btn variant="text" @click="switchAction" class="switch-btn">
              Action
              <span class="material-symbols-outlined">
                {{ toggle }}
              </span>
            </v-btn>
          </th>
          <th v-for="header in headers" :key="header.action">
            {{ header.action }}
          </th>
        </tr>
      </thead>
    </template>
  </v-data-table-virtual>
</template>

<script>
export default {
  props: {
    faculties: {
      type: Array,
      required: true,
    },
  },
  data() {
    return {
      toggle: "switch_right",
      showFacultyInfo: false,
      showViewInfo: true,
      headers: [
        {
          title: "Employee No",
          align: "center",
          key: "employee_id",
          sortable: false,
        },
        { title: "Name", align: "end", key: "name" },
        { title: "Status", align: "end", key: "status", sortable: false },
        {
          title: "Baccalaureate Degree",
          align: "end",
          key: "degree",
          sortable: false,
        },
        {
          title: "Specialization",
          align: "end",
          key: "specialization",
          sortable: false,
        },
        { title: "Gender", align: "end", key: "sex" },
        { title: "Action", align: "center", key: "action", sortable: false },
      ],
      filterType: "",
    };
  },

  methods: {
    viewInfo(faculty) {
      this.showFacultyInfo = true;
    },
    editInfo(faculty) {},
    getStatus(status) {
      if (status == "Active") return "green";
      else if (status == "Deactivated") return "red";
    },
    switchAction() {
      if (this.toggle == "switch_right") {
        this.toggle = "switch_left";
      } else {
        this.toggle = "switch_right";
      }
      this.showViewInfo = !this.showViewInfo;
    },
  },
};
</script>
<style scoped>
.screen-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(143, 143, 143, 0.5); /* Semi-transparent overlay */
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 1000; /* Ensure the overlay is on top of everything */
}

.info-dialog {
  background-color: white;
  padding: 10px;
  border-radius: 4px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
}
.switch-btn {
  text-transform: none;
  transform: translateX(3%);
}
.switch-btn span {
  margin-left: 10px;
}
.detail-btn {
  font-size: 12px;
}
.bold-name {
  font-weight: 600;
}
</style>
