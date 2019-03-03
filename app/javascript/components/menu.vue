<template>
  <v-card>
    <v-card-title>
      {{ status.gameIntroMessage }}
    </v-card-title>
    <v-card-text>
      <v-list>
        <v-list-tile>
          <v-list-tile-title>
            Select Level
          </v-list-tile-title>
        </v-list-tile>
        <v-list-tile
          exact
          v-for="level in levels"
          :to="`levels/${level.identifier}`"
          :key="level.identifier"
        >
          {{ level.identifier }}
        </v-list-tile>
      </v-list>
    </v-card-text>
  </v-card>
</template>

<script>
import { getLevels, getStatus } from '../services/api'

export default {
  data: () => ({
    levels: [],
    status: {}
  }),
  mounted() {
    getLevels().then(result => (this.levels = result.levels))
    getStatus().then(result => (this.status = result.status))
  }
}
</script>
