<template>
  <v-card>
    <v-card-title> Level {{ $route.params.levelNumber }} </v-card-title>
    <v-card-text>
      {{ this.level.name }}
      <Diff
        :source1="currentStage.source1"
        :source2="currentStage.source2"
      />
    </v-card-text>
  </v-card>
</template>

<script>
import Diff from './diff'

import { getLevels } from '../services/api'

export default {
  components: { Diff },
  props: {
    level: Object
  },
  data: () => ({
    stageNumber: 0
  }),
  computed: {
    currentStage() {
      return this.level.stages[0]
    }
  }
}
</script>
