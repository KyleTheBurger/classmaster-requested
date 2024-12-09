<template>
  <v-container>
    <!-- Create Section Form -->
    <v-card class="mb-5">
      <v-card-title>
        <span class="CsectionHeadline">Create Section</span>
      </v-card-title>
      <v-card-text>
        <v-row align="center">
          <v-col cols="12" md="6" lg="3" class="d-flex align-center">
            <span class="mr-2">Select Strand:</span>
            <v-select
              v-model="selectedStrand"
              :items="strands"
              density="compact"
              variant="solo-filled"
              hide-details
              style="max-width: 120px"
              @change="updateNeededSections"
            ></v-select>
          </v-col>
          <v-col cols="12" md="6" lg="3" class="d-flex align-center">
            <span class="mr-2">No. of students:</span>
            <v-text-field
              :value="numberOfStudents"
              type="number"
              density="compact"
              variant="flat"
              hide-details
              readonly
              style="max-width: 80px"
            ></v-text-field>
          </v-col>
          <v-col cols="12" md="6" lg="3" class="d-flex align-center">
            <span class="mr-2">No. of needed sections:</span>
            <v-text-field
              :value="`${
                createdSections[selectedStrand] || 0
              }/${neededSections}`"
              type="text"
              hide-details
              density="compact"
              variant="flat"
              readonly
              style="max-width: 80px"
            ></v-text-field>
          </v-col>
          <v-col cols="12" md="3" lg="3" class="d-flex align-end justify-end">
            <v-btn
              text
              color="green"
              variant="elevated"
              @click="openDialog"
              :disabled="isAddButtonDisabled"
              ><span class="material-symbols-outlined"> add_circle </span>Add
              Section</v-btn
            >
          </v-col>
        </v-row>
      </v-card-text>
    </v-card>

    <!-- Section Record Table -->
    <v-card flat>
      <v-card-title>
        <span class="sectionHeadline">Section Record</span>
      </v-card-title>
      <v-card flat>
        <v-row class="d-flex justify-space-between align-center">
          <v-col cols="4" md="3">
            <!-- <v-select
              v-model="selectedYr"
              :items="acadsYr"
              label="Academic Yr"
              hide-details
              density="compact"
              variant="solo-filled"
            ></v-select> -->
          </v-col>

          <v-col cols="4" md="4">
            <v-text-field
              v-model="search"
              append-icon="mdi-magnify"
              label="Search"
              single-line
              hide-details
              density="compact"
              variant="outlined"
            ></v-text-field>
          </v-col>
        </v-row>
      </v-card>
      <v-data-table-virtual
        :headers="headers"
        :items="sections"
        height="350"
        class="table"
        item-key="id"
        fixed-header
        :header-props="{
          style: 'font-size:14px;',
          style: 'background-color:#E0E0E0',
        }"
      >
        <template v-slot:item.actions="{ item }">
          <v-btn color="cyan-lighten-2" text @click="viewList(item)"
            >View List</v-btn
          >
        </template>
      </v-data-table-virtual>
      <p class="noOfSections">{{ totalSection }} section(s).</p>
      <!-- Assign Room Button -->
      <v-btn color="green-lighten-1" class="assignBtn" @click="openRoomDialog"
        ><span class="material-symbols-outlined"> assignment_turned_in </span
        >Assign Room</v-btn
      >
    </v-card>

    <!-- Add Section Dialog -->
    <v-dialog v-model="addSectionDialog" max-width="400px">
      <v-card>
        <v-card-title>
          <span class="headline">Add Section</span>
        </v-card-title>
        <v-card-text>
          <v-form @submit.prevent="addSection">
            <v-select
              v-model="newSection.strand"
              :items="strandNames"
              label="Strand"
              density="compact"
              variant="outlined"
              required
            ></v-select>
            <v-text-field
              v-model="newSection.section"
              label="Section"
              density="compact"
              variant="outlined"
              required
            ></v-text-field>
          </v-form>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn text color="red" @click="closeDialog">Cancel</v-btn>
          <v-btn color="success" @click="addSection">Add</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>

    <!-- Assign Room Dialog -->
    <v-dialog v-model="roomDialog" max-width="500px">
      <v-card>
        <v-card-title class="assignRoomTitle">
          <span>ASSIGN ROOM</span>
        </v-card-title>
        <v-card-text>
          <v-form ref="roomForm" v-model="roomValid">
            <v-row>
              <v-col cols="6" md="6">
                <v-select
                  v-model="roomData.section"
                  :items="sectionList"
                  label="Section"
                  hide-details
                  density="compact"
                  variant="outlined"
                  required
                ></v-select>
              </v-col>
              <v-col cols="6" md="6">
                <v-select
                  v-model="roomData.room"
                  :items="roomNames"
                  label="Room"
                  hide-details
                  density="compact"
                  variant="outlined"
                  required
                ></v-select>
              </v-col>
            </v-row>
            <v-card-title class="roomInfoTitle">ROOM INFORMATION</v-card-title>
            <v-row>
              <v-col cols="12" md="6">
                <div class="roomInfo">
                  <strong>Building:</strong> {{ roomData.building }}
                </div>
              </v-col>
              <v-col cols="12" md="6">
                <div class="roomInfo">
                  <strong>Status:</strong> {{ roomData.status }}
                </div>
              </v-col>
            </v-row>
            <v-row>
              <v-col cols="12" md="6">
                <div class="roomInfo">
                  <strong>Floor:</strong> {{ roomData.room_floor }}
                </div>
              </v-col>
              <v-col cols="12" md="6">
                <div class="roomInfo">
                  <strong>Capacity:</strong> {{ roomData.capacity }}
                </div>
              </v-col>
            </v-row>
            <v-row>
              <v-col cols="12" md="6">
                <div class="roomInfo">
                  <strong>Room Type:</strong> {{ roomData.room_type }}
                </div>
              </v-col>
            </v-row>
          </v-form>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn text color="red" @click="closeRoomDialog">Cancel</v-btn>
          <v-btn color="success" @click="assignRoom">Assign</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>

    <!-- ViewList Dialog -->
    <v-dialog v-model="studentlistdialog" max-width="700px">
      <v-card>
        <v-card-title>
          <span class="studentList_headline">STUDENT LIST</span>
        </v-card-title>
        <v-card class="listSubtitle">
          <v-row>
            <v-col
              ><strong>Section:</strong>{{ students[0]?.section_name }}</v-col
            >
            <v-col
              ><strong>Grade Level:</strong
              >{{ students[0]?.grade_level }}</v-col
            >
            <v-col><strong>Adviser:</strong></v-col>
            <v-col><strong>Shift:</strong> {{ students[0]?.shift }}</v-col>
          </v-row>
        </v-card>
        <v-col cols="4" md="3">
          <v-select
            v-model="students.gender"
            :items="gender"
            label="Gender"
            density="compact"
            variant="solo"
          ></v-select>
        </v-col>
        <v-card class="scrollable-table-card">
          <v-data-table-virtual
            :headers="listTableHeaders"
            :items="students"
            item-value="student_id"
            :header-props="{
              style: 'font-weight: bold;',
            }"
            class="studentSectionList"
            fixed-header
          >
            <template v-slot:item.action="{ item }">
              <v-btn color="green" variant="tonal" @click="editStudent(item)">
                <span class="material-symbols-outlined">edit</span>
              </v-btn>
              <!-- <v-btn color="red" variant="tonal" @click="deleteStudent(item)">
              <span class="material-symbols-outlined">delete</span>
            </v-btn> -->
            </template>
          </v-data-table-virtual>
        </v-card>
        <p class="noOfStudents">TOTAL: {{ students.length }} students.</p>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn text color="red" @click="studentlistdialog = false"
            >Close</v-btn
          >
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-container>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      gender: ["All", "Male", "Female"],
      selectedStrand: "",
      studentCounts: {},
      createdSections: {},
      rooms: [],
      strands: [],
      strandNames: [],
      sectionNames: [],
      roomNames: [],
      sectionList: [],

      headers: [
        { title: "Section", align: "center", value: "section_name" },
        { title: "Strand", align: "center", value: "strand_name" },
        { title: "Room", align: "center", value: "room_name" },
        { title: "Adviser", align: "center", value: "adviser" },
        {
          title: "Actions",
          align: "center",
          value: "actions",
          sortable: false,
        },
      ],
      sections: [],
      listTableHeaders: [
        { title: "Student ID", align: "start", value: "student_id" },
        { title: "Name", align: "left", value: "student_name" },
        { title: "Action", align: "center", value: "action", sortable: false },
      ],
      students: [],

      addSectionDialog: false,
      roomDialog: false,
      studentlistdialog: false,
      valid: false,
      roomValid: false,
      newSection: {
        strand: "",
        section: "",
      },
      roomData: {
        section: "",
        room: "",
      },
    };
  },
  mounted() {
    this.getSections();
    this.fetchRooms();
    this.fetchStudentCounts();
    this.addSection();
  },
  methods: {
    async addSection() {
      if (this.newSection.section) {
        console.log("Sending data:", {
          strand_name: this.newSection.strand,
          section_name: this.newSection.section,
        });
        try {
          const response = await axios.post(
            "http://localhost:3000/sectioning/src/database/SectionHandler.php",
            {
              strand_name: this.newSection.strand,
              section_name: this.newSection.section,
            }
          );

          if (response.data.success) {
            alert("Section added successfully.");
            this.getSections();
          } else {
            alert("Failed to add section: " + response.data.error);
          }
        } catch (error) {
          console.error("Error adding section:", error);
          alert("An error occurred while adding the section.");
        }
        this.closeDialog();
      }
    },
    async fetchStudentCounts() {
      try {
        const response = await axios.get(
          "http://localhost:3000/sectioning/src/database/TotalStudentsPerStrand.php"
        );
        const data = response.data;
        this.studentCounts = data.reduce((acc, strand) => {
          acc[strand.strand] = strand.student_count;
          return acc;
        }, {});
        this.strands = Object.keys(this.studentCounts);
      } catch (error) {
        console.error("Error fetching student counts:", error);
      }
    },
    async fetchRooms() {
      try {
        const response = await axios.get(
          "http://localhost:3000/sectioning/src/database/RoomHandler.php"
        );
        const data = response.data;
        this.rooms = data.room_status_view;
        this.roomNames = data.available_rooms;
      } catch (error) {
        console.error("Error fetching rooms:", error);
      }
    },
    async getSections() {
      try {
        const response = await axios.get(
          "http://localhost:3000/sectioning/src/database/SectionRoom.php"
        );
        const data = response.data;

        if (data.section_view) {
          this.sections = data.section_view;
          this.sectionNames = this.sections.map(
            (section) => section.section_name
          );
          this.strandNames = [
            ...new Set(this.sections.map((section) => section.strand_name)),
          ];
        }

        if (data.available_sections) {
          this.sectionList = data.available_sections;
        }
      } catch (error) {
        console.error("Error fetching sections:", error);
      }
    },
    updateNeededSections() {
      if (this.createdSections[this.selectedStrand] >= this.neededSections) {
        alert(
          `The needed sections for ${this.selectedStrand} are already completed.`
        );
      }
    },
    openDialog() {
      if (this.createdSections[this.selectedStrand] >= this.neededSections) {
        alert(
          `The needed sections for ${this.selectedStrand} are already completed.`
        );
        return;
      }
      this.newSection.strand = this.selectedStrand;
      this.addSectionDialog = true;
    },
    closeDialog() {
      this.addSectionDialog = false;
      this.newSection = { strand: "", section: "" };
    },
    openRoomDialog() {
      this.roomDialog = true;
    },
    closeRoomDialog() {
      this.roomDialog = false;
      this.roomData = {
        strand: "",
        section: "",
        room: "",
        building: "",
        status: "",
        room_floor: "",
        capacity: "",
        room_type: "",
      };
    },
    async assignRoom() {
      if (this.$refs.roomForm.validate()) {
        try {
          const response = await axios.post(
            "http://localhost:3000/sectioning/src/database/SectionRoom.php",
            {
              section_name: this.roomData.section,
              room_name: this.roomData.room,
            }
          );
          alert(
            `Successfully assigned ${this.roomData.room} to ${this.roomData.section}`
          );
          this.getSections();
          this.closeRoomDialog();
        } catch (error) {
          console.error("Error assigning room:", error);
        }
      }
    },
    async viewList(section) {
      try {
        const response = await axios.get(
          "http://localhost:3000/sectioning/src/database/ClassList.php",
          {
            params: { section: section.section_name },
          }
        );
        this.students = response.data;
        this.studentlistdialog = true;
      } catch (error) {
        console.error("Error fetching student list:", error);
      }
    },
  },
  computed: {
    numberOfStudents() {
      return this.studentCounts[this.selectedStrand] || 0;
    },
    neededSections() {
      return Math.ceil(this.numberOfStudents / 45);
    },
    totalSection() {
      return this.sections.length;
    },
    sectionsForStrand() {
      return this.sections
        .filter((section) => section.strand === this.roomData.strand)
        .map((section) => section.section);
    },
    isAddButtonDisabled() {
      return !this.selectedStrand;
    },
  },
  watch: {
    selectedStrand() {
      this.updateNeededSections();
    },
    "roomData.room"(newRoom) {
      if (newRoom) {
        const selectedRoom = this.rooms.find(
          (room) => room.room_name === newRoom
        );
        if (selectedRoom) {
          this.roomData.building = selectedRoom.building;
          this.roomData.status = selectedRoom.status;
          this.roomData.room_floor = selectedRoom.room_floor;
          this.roomData.capacity = selectedRoom.capacity;
          this.roomData.room_type = selectedRoom.room_type;
        }
      }
    },
  },
};
</script>

<style scoped>
.v-card {
  margin-bottom: 16px;
}

.v-select,
.v-text-field {
  margin-right: 16px;
}

.v-btn {
  text-transform: none;
  font-size: 14px;
}

.sectionHeadline,
.CsectionHeadline {
  color: rgb(64, 64, 64);
  font-weight: bold;
}
.sectionHeadline {
  display: flex;
  justify-content: center;
  align-items: center;
}
.table {
  border: 2px solid #cac9c9;
  border-radius: 4px;
}

.noOfSections {
  font-size: 10px;
  padding-left: 23px;
}

.roomInfoTitle {
  border-bottom: solid 3px rgb(222, 220, 220);
  margin-top: 20px;
  margin-bottom: 10px;
  color: rgb(98, 98, 98);
  font-weight: bold;
  font-size: 16px;
}

.roomInfo {
  color: rgb(151, 151, 151);
}

.assignRoomTitle,
.studentList_headline {
  border-bottom: solid 3px rgb(80, 25, 25);
  color: rgb(64, 64, 64);
  font-weight: bold;
  font-size: 22px;
  display: flex;
  justify-content: center;
  align-items: center;
  margin-bottom: 10px;
}

.assignBtn {
  float: right;
}

.listSubtitle {
  background-color: #f5f5f5;
  padding: 15px;
  margin: 10px;
}
.studentSectionList {
  padding: 10px;
  max-height: 100%;
}
.scrollable-table-card {
  height: 400px;
  overflow-y: auto;
  overflow-x: hidden;
}
.noOfStudents {
  font-size: 10px;
  padding-left: 23px;
}
</style>
