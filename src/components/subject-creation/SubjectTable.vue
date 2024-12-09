<template>
  <v-data-table-virtual
    :headers="getHeaders"
    :items="subjects"
    style="font-size: 13px"
    height="370"
    item-value="id"
    :header-props="{ style: 'font-size:15px;' }"
    :row-props="{ style: 'font-size:14px;' }"
    :fixed-header="showForm"
    class="table"
    hover
  >
    <template #[`item.subject_name`]="{ value }">
      <span style="font-weight: 500">{{ value }}</span>
    </template>
    <template #[`item.subject_lvl`]="{ value }">
      <span>G{{ value }}</span>
    </template>
    <template #[`item.semester`]="{ value }">
      <span>{{ value == "1" ? "1st" : "2nd" }}</span>
    </template>
    <template #[`item.strand_name`]="{ value }">
      <span>{{ value != null ? value : "-----" }}</span>
    </template>
    <template #[`item.domain_name`]="{ value }">
      <v-chip :color="getColor(value)"> {{ value }} </v-chip>
    </template>

    <template #[`item.action`]="{ item }">
      <v-btn
        color="rgba(227, 213, 0, 0.42)"
        class="mr-5 detail-btn"
        @click="editSubjectInfo(item)"
      >
        <span class="mr-3 material-symbols-outlined"> edit </span> EDIT
      </v-btn>
    </template>
  </v-data-table-virtual>
</template>

<script>
export default {
  props: {
    otherDetail: Boolean,
    subjects: Array,
    showForm: Boolean,
  },
  data() {
    return {
      headers: [
        {
          title: "Subject Name",
          align: "start",
          key: "subject_name",
          sortable: false,
          width: "300px",
        },
        { title: "Domain", align: "center", key: "domain_name" },
        { title: "Type", align: "center", key: "subject_type" },
        { title: "Subject Level", align: "center", key: "subject_lvl" },
        { title: "Semester", align: "center", key: "semester" },
        { title: "Strand", align: "center", key: "strand_name" },
        { title: "Unit", align: "center", key: "unit" },
        { title: "Action", align: "center", key: "action" },
      ],
    };
  },
  computed: {
    getHeaders() {
      if (!this.otherDetail) {
        return this.headers.filter(
          (header) => header.key !== "strand_name" && header.key !== "unit"
        );
      }
      return this.headers;
    },
  },

  methods: {
    getColor(domain) {
      switch (domain) {
        case "English":
          return "yellow";
        case "Math":
          return "blue";
        case "Sci-Tech":
          return "orange";
        case "Specialization":
          return "purple";
        case "P.E":
          return "#B5CAF3";
        case "Filipino":
          return "red";
        default:
          return "rgb(251, 251, 81)";
      }
    },
    editSubjectInfo(item) {
      this.$emit("updateSubjectInfo", item);
    },
  },
};
</script>
<style scoped>
.table {
  width: 100%;
  box-shadow: 2px 2px 15px 1px rgb(195, 193, 193);
  padding: 5px 15px 25px 20px;
}
</style>
