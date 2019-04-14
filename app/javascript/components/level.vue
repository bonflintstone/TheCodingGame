<template>
  <v-card>
    <v-card-title>
      Level {{ this.level.identifier }}
    </v-card-title>
    <v-card-text>
      <template v-if="stepNumber === -1">
        {{ level.level_intro_message }}
        <v-btn @click="stepNumber = 0">
          Start
        </v-btn>
      </template>
      <template v-if="stepNumber >= 0 && stepNumber < stepCount">
        <p> Step {{ stepNumber + 1 }} out of {{ stepCount }} </p>
        <Diff
          :source1="currentStep.file1_content"
          :source2="currentStep.file2_content"
        />
        <Questions @submit="submit" :questions="currentStep.questions" />
      </template>
      <template v-if="stepNumber >= stepCount">
        {{ level.level_conclusion_message }}
      </template>
    </v-card-text>
  </v-card>
</template>

<script>
import Diff from './diff'
import Questions from './questions'
import { saveResult } from '../services/api'

export default {
  components: { Diff, Questions },
  props: {
    level: Object
  },
  data: () => ({
    stepNumber: -1
  }),
  computed: {
    currentStep() {
      return this.level.steps[this.stepNumber]
    },
    stepCount() {
      return this.level.steps.length
    }
  },
  methods: {
    submit(answerIds) {
      saveResult(this.currentStep.id, answerIds)
        .then(() => this.stepNumber++)
    }
  }
}
</script>
