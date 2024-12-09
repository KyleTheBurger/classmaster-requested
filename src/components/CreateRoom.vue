<template>
  <v-container>
    <v-card flat>
      <!-- Filters and search bar -->
      <v-row class="d-flex justify-space-between align-center">
        <!-- Building filter -->
        <v-col cols="4" md="2">
          <v-select
            v-model="selectedBuilding"
            :items="buildings"
            label="Building"
            hide-details
            dense
            density="compact"
            variant="solo-filled"
          ></v-select>
        </v-col>
        
        <!-- Checkbox to show available rooms only -->
        <v-col cols="4" md="2">
          <v-checkbox
            v-model="showAvailableOnly"
            label="Show Available"
            hide-details
            dense
            density="compact"
            style="font-size: small;"
          ></v-checkbox>
        </v-col>
        
        <!-- Button to add new room -->
        <v-col cols="4" md="2">
          <v-btn @click="addRoomDialog = true" color="blue-grey lighten-2" dark variant="elevated">
            <span class="material-symbols-outlined"> add_circle </span>
          </v-btn>
        </v-col>
  
        <!-- Search field -->
        <v-col cols="4" md="6">
          <v-text-field
            v-model="search"
            append-icon="mdi-magnify"
            label="Search"
            single-line
            hide-details
            dense
            density="compact"
            variant="outlined"
          ></v-text-field>
        </v-col>
      </v-row>
    </v-card>

    <!-- Display rooms -->
    <v-card class="rooms-container" flat>
      <v-row class="mt-5">
        <v-col
          cols="12"
          sm="6"
          md="4"
          lg="3"
          v-for="room in filteredRooms"
          :key="room.id"
        >
          <v-btn
            block
            :color="room.status === 'occupied' ? 'red-lighten-3' : 'green-lighten-3'"
            dark
            class="room-button"
            variant="elevated" 
            @click="openRoomDialog(room)"
          >
            <v-row class="d-flex flex-column align-center text-center">
              <v-col>
                <strong class="room-name">{{ room.room_name }}</strong>
              </v-col>
              <v-col>
                (<small>{{ room.status }}</small>)
              </v-col>
            </v-row>
          </v-btn>
        </v-col>
      </v-row>
    </v-card>

    <!-- Room Details Dialog -->
    <v-dialog v-model="dialog" max-width="400px">
      <v-card>
        <v-card-title class="RoomInfo">{{ selectedRoom.room_name }}</v-card-title>
        <v-card-text>
          <div><strong>Building:</strong> {{ selectedRoom.building }}</div>
          <div><strong>Floor:</strong> {{ selectedRoom.room_floor }}</div>
          <div><strong>Room Type:</strong> {{ selectedRoom.room_type }}</div>
          <div><strong>Capacity:</strong> {{ selectedRoom.capacity }}</div>
          <div><strong>Status:</strong> {{ selectedRoom.status }}</div>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="red" text @click="dialog = false">Close</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>

    <!-- Add Room Dialog -->
    <v-dialog v-model="addRoomDialog" max-width="500px">
      <v-card>
        <v-card-title class="cardTitle">Add Room</v-card-title>
        <v-card-text>
          <v-form @submit.prevent="addRoom">
            <v-select
              v-model="newRoom.building"
              :items="buildings"
              label="Building"
              density="compact"
              variant="outlined"
              required
            ></v-select>
            <v-select
              v-model="newRoom.room_floor"
              :items="floors"
              label="Floor"
              density="compact"
              variant="outlined"
              required
            ></v-select>
            <v-select
              v-model="newRoom.room_type"
              :items="roomTypes"
              label="Room Type"
              density="compact"
              variant="outlined"
              required
            ></v-select>
            <v-text-field
              v-model="newRoom.room_name"
              label="Room Name"
              density="compact"
              variant="outlined"
              required
            ></v-text-field>
            <v-text-field
              v-model="newRoom.capacity"
              label="Capacity"
              density="compact"
              variant="outlined"
              required
            ></v-text-field>
          </v-form>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="red" text @click="addRoomDialog = false">Cancel</v-btn>
          <v-btn color="green" @click="addRoom">Add Room</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-container>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      buildings: ["AMS", "JH"],
      floors: ["1st floor", "2nd floor", "3rd floor"],
      roomTypes: ["Classroom", "Laboratory"],
      selectedBuilding: "",
      search: "",
      showAvailableOnly: false,
      rooms: [],
      roomStatusView: [],
      newRoom: {
        building: "",
        room_floor: "",
        room_type: "",
        room_name: "",
        capacity: "",
      },
      dialog: false,
      addRoomDialog: false,
      selectedRoom: {},
    };
  },
  computed: {
    filteredRooms() {
      return this.rooms.filter(room => {
        const matchesSearch = room.room_name && room.room_name.toLowerCase().includes(this.search.toLowerCase());
        const matchesBuilding = this.selectedBuilding ? room.building === this.selectedBuilding : true;
        const matchesStatus = !this.showAvailableOnly || room.status === 'available';
        return matchesSearch && matchesBuilding && matchesStatus;
      });
    },
  },
  methods: {
    async fetchRooms() {
      try {
        const response = await axios.get('http://localhost:3000/sectioning/src/database/RoomHandler.php');
        this.roomStatusView = response.data.room_status_view;
        this.rooms = this.roomStatusView.map(room => {
          if (room.status === 'occupied') {
            room.status = 'occupied';
          }
          return room;
        });
      } catch (error) {
        console.error('Error fetching rooms:', error);
      }
    },
    async addRoom() {
      try {
        const duplicateRoom = this.rooms.find(room => room.room_name.toLowerCase() === this.newRoom.room_name.toLowerCase());
        if (duplicateRoom) {
          alert('Room with this name already exists!');
          return;
        }
        const response = await axios.post('http://localhost:3000/sectioning/src/database/RoomHandler.php', this.newRoom); 
        const newRoom = response.data; 
        this.rooms.push(newRoom); 
        this.addRoomDialog = false; 
        this.resetNewRoom(); 
        alert('Room added successfully!');
      } catch (error) {
        console.error('Error adding room:', error); 
      }
    },
    resetNewRoom() {
      this.newRoom = {
        building: "",
        room_floor: "",
        room_type: "",
        room_name: "",
        capacity: "",
      };
    },
    openRoomDialog(room) {
      this.selectedRoom = room;
      this.dialog = true;
    },
  },
  created() {
    this.fetchRooms(); 
  },
};
</script>

<style scoped>
.room-name {
  font-size: 24px;
  color: #525252;
  font-weight: bold;

}

.rooms-container {
  margin-top: 25px;
  height: 550px;
  overflow-y: auto;
}
.room-button{
  width: 100px;
  height: 150px;
  justify-content: center;
  text-align: center;
  white-space: normal;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.cardTitle{
  border-bottom: solid 3px rgb(140, 38, 38);
}

.RoomInfo{
  border-bottom: solid 3px rgb(140, 38, 38);
}
</style>
