<template>
  <v-card>
    <v-card-text v-if="!loading">
      <template v-if="status.finished">
        <div v-html="status.gameConclusionMessage" />
      </template>

      <template v-else-if="status.levelNumber == null">
        <div v-html="status.gameIntroMessage" />
        <v-btn :to="`/levels/${levelIdentifier}`">
          Get started with the first level!
        </v-btn>
      </template>

      <template v-else>
        <template v-if="status.stepNumber != null">
          You still got work todo in level

          <v-btn :to="`/levels/${levelIdentifier}`">
            {{ currentLevelNumber }}
          </v-btn>
        </template>

        <template v-if="status.stepNumber == null">
          Get started with level
          <v-btn :to="`/levels/${levelIdentifier}`">
            {{ currentLevelNumber }}
          </v-btn>
        </template>
      </template>
    </v-card-text>
  </v-card>
</template>

<script>
import { getLevels, getStatus } from '../services/api'

export default {
  data: () => ({
    levels: [],
    status: {},
    loading: true
  }),
  computed: {
    currentLevelNumber() {
      return this.status.levelNumber || 0
    },
    levelIdentifier() {
      return this.status.levelIdentifier
    }
  },
  mounted() {
    Promise.all([getStatus(), getLevels()])
      .then(([statusData, levelsData]) => {
        this.status = statusData.status
        this.levels = levelsData.levels
      })
      .then(() => (this.loading = false))
  }
}
</script>
