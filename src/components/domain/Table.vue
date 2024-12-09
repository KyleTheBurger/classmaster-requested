<template>
  <v-data-table-virtual
    :headers="headers"
    :items="domainList"
    style="font-size: 13px"
    height="430"
    item-value="id"
    :header-props="{ style: 'font-size:14px;' }"
    fixed-header
    class="table"
    hover
  >
    <template #[`item.name`]="{ value }">
      <span style="font-weight: bold">{{ value }}</span>
    </template>
    <template #[`item.description`]="{ value }">
      <div class="mt-3 mb-3" style="text-align: justify">
        <span>{{ value }}</span>
      </div>
    </template>

    <template #[`item.action`]="{ item }">
      <v-btn
        color="rgba(227, 213, 0, 0.42)"
        class="mr-5 detail-btn"
        @click="updateDescription(item)"
      >
        <span class="material-symbols-outlined"> edit </span>
      </v-btn>
    </template>
  </v-data-table-virtual>
</template>

<script>
export default {
  props: {
    domainList: Array,
  },
  data() {
    return {
      headers: [
        {
          title: "Domain Name",
          align: "start",
          key: "domain_name",
          sortable: false,
        },
        { title: "Description", align: "center", key: "description" },
        { title: "Action", align: "center", key: "action" },
      ],
    };
  },

  methods: {
    switchAction() {
      if (this.toggle == "switch_right") {
        this.toggle = "switch_left";
      } else {
        this.toggle = "switch_right";
      }
      this.showViewInfo = !this.showViewInfo;
    },
    updateDescription(item) {
      this.$emit("updateDescription", item);
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
