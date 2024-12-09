<template>
  <VRow class="d-d-flex justify-center">
    <VCol
      v-for="cohort in cohortList"
      :key="cohort.cohort_id"
      cols="12"
      md="6"
      lg="4"
      xl="4"
    >
      <v-card
        width="300"
        class="card"
        :style="{ 'border-left': '14px solid' + getColor(cohort.cohort_name) }"
      >
        <v-card-title>
          {{ cohort.cohort_name }}
        </v-card-title>
        <v-card-subtitle>
          Group by:
          <v-chip
            variant="flat"
            :color="getColor(strand)"
            v-for="strand in cohort.associated_strands"
            :key="strand"
            class="ml-1"
          >
            {{ strand }}
          </v-chip>
        </v-card-subtitle>
        <v-card-actions>
          <v-btn
            color="blue-lighten-2"
            text
            :to="{
              name: 'cohortAssignment',
              params: { cohortName: cohort.cohort_name },
            }"
          >
            Assign Faculty
          </v-btn>
          <v-spacer></v-spacer>
          <v-btn
            :icon="cohort.show ? 'mdi-chevron-up' : 'mdi-chevron-down'"
            @click="toggleShow(cohort)"
          ></v-btn>
        </v-card-actions>

        <v-expand-transition>
          <div v-show="cohort.show">
            <v-divider></v-divider>

            <v-card-text>
              <p style="font-weight: 500">
                Learning Supervisor:
                {{
                  cohort.learning_supervisor != null
                    ? cohort.learning_supervisor
                    : "No supervisor yet"
                }}
              </p>
              <p>Learning Facilitator:</p>
              <ul>
                <li
                  v-for="facilitator in cohort.learning_facilitator"
                  :key="facilitator"
                >
                  {{ facilitator }}
                </li>
              </ul>
            </v-card-text>
          </div>
        </v-expand-transition>
      </v-card>
    </VCol>
  </VRow>
</template>

<script>
export default {
  props: {
    cohortList: Array,
  },
  data() {
    return {};
  },
  methods: {
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
        case "TVL-ICT":
          return "#A5CAF3";
        case "TVL-FBS":
          return "#63d9aa";
        case "HUMMS":
          return "rgb(220, 191, 127)";
        default:
          return "rgb(251, 251, 81)";
      }
    },
    toggleShow(cohort) {
      cohort.show = !cohort.show;
    },
  },
};
</script>

<style>
.card {
  margin: 10px;
  box-shadow: 1px 2px 10px 2px rgb(223, 223, 223);
}
</style>
