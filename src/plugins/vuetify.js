// Styles
import '@mdi/font/css/materialdesignicons.css'
import 'vuetify/styles'

// Vuetify
import { createVuetify } from 'vuetify'
import { VDateInput } from 'vuetify/labs/VDateInput'
import { VCalendar } from 'vuetify/lib/labs/components.mjs'

export default createVuetify({
  components: {
    VDateInput,
    VCalendar
  },
})