<template>
  <div
    class="screen-overlay"
    v-if="showFacultyInfo"
    @click="showFacultyInfo = !showFacultyInfo"
  ></div>
  <v-data-table-virtual
    expand-on-click
    :headers="headers"
    :items="data"
    height="370px"
    style="font-size: 13px"
    item-value="employee_id"
    :fixed-header="fixedTableHeader"
    :header-props="{ style: 'font-size:14px;' }"
    class="cohortTable"
  >
    <template #[`item.action`]="{ item }">
      <v-btn
        v-if="showViewInfo"
        color="primary"
        @click="showCohortLoadForm(item)"
        class="detail-btn"
      >
        <span class="material-symbols-outlined"> event_upcoming </span>
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
    <template #[`item.unit_load`]="{ item }">
      <v-chip :color="getLoadStatus(item.unit_load, item.designation)">
        {{ item.unit_load + "/" + getMaxLoad(item.designation) }}
      </v-chip>
    </template>
    <template #[`item.cohort`]="{ value }">
      {{ getCohortStatus(value) }}
    </template>
    <template #[`item.name`]="{ value }">
      <span class="bold-name">{{ value }}</span>
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
  <div v-if="setCohortLoadForm" class="cohortload-form">
    <CohortLoadForm
      :facultyToAssign="facultyToAssign"
      @cancel-transaction="cancel"
    />
  </div>
</template>

<script>
import CohortLoadForm from "@/components/cohort-loading/CohortLoadForm.vue";
export default {
  props: {
    data: {
      type: Array,
      required: true,
    },
  },
  components: {
    CohortLoadForm,
  },
  data() {
    return {
      toggle: "switch_right",
      fixedTableHeader: true,
      setCohortLoadForm: false,
      showViewInfo: true,
      showFacultyInfo: false,
      facultyToAssign: null,
      headers: [
        { title: "Name", align: "start", key: "name" },
        {
          title: "Designation",
          align: "end",
          key: "designation",
          sortable: false,
        },
        { title: "Unit Load", align: "end", key: "unit_load" },
        {
          title: "Specialization",
          align: "end",
          key: "specialization",
          sortable: false,
        },
        { title: "Action", align: "center", key: "action", sortable: false },
      ],
    };
  },

  methods: {
    cancel() {
      this.facultyToAssign = null;
      this.fixedTableHeader = true;
      this.setCohortLoadForm = false;
    },
    showCohortLoadForm(item) {
      this.fixedTableHeader = false;
      this.setCohortLoadForm = true;
      this.facultyToAssign = item;
    },
    getCohortStatus(item) {
      if (item != null && item != "") {
        return item;
      }
      return "N/A";
    },
    getLoadStatus(unitLoad, designation) {
      const maxLoad = this.getMaxLoad(designation);
      if (designation == "Learning Supervisor") {
        if (unitLoad == maxLoad) return "green";
        else if (unitLoad < maxLoad) return "blue";
        else if (unitLoad > maxLoad) return "red";
      } else {
        if (unitLoad == maxLoad) return "green";
        else if (unitLoad < maxLoad) return "blue";
        else if (unitLoad > maxLoad && unitLoad <= maxLoad + 6) return "orange";
        else if (unitLoad > maxLoad + 6) return "red";
      }
    },
    getMaxLoad(designation) {
      return designation === "Learning Supervisor" ? 12 : 24;
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
.cohortload-form {
  width: 50%;
  height: 75vh;
  position: absolute;
  left: 50%;
  top: 50%;
  background: white;
  border-top: 5px solid maroon;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
  transform: translate(-50%, -50%);
}
.cohortTable {
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
  padding: 0 10px;
  overflow: auto;
  height: 330px;
}
.screen-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(143, 143, 143, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 1000;
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
