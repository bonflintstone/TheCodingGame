<template>
  <v-card>
    <v-card-text v-if="status.currentLevel">
      <template v-if="status.levelStatus === 'new'">
        <p>{{ status.gameIntroMessage }}</p>
        <v-btn :to="`/levels/${status.currentLevel.id}`">
          Get started with the first level!
        </v-btn>
      </template>
      <template v-if="status.levelStatus === 'finished'">
        <p>{{ status.gameConclusionMessage }}</p>
      </template>
      <template v-if="status.levelStatus === 'inLevel'">
        You still got work todo in level

        <v-btn :to="`/levels/${status.currentLevel.id}`">
          {{ status.currentLevel.name }}
        </v-btn>
      </template>
      <template v-if="status.levelStatus === 'betweenLevels'">
        Get started with level
        <v-btn :to="`/levels/${status.currentLevel.id}`">
          {{ status.currentLevel.name }}
        </v-btn>
      </template>
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
