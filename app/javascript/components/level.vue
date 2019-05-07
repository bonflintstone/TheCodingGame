<template>
  <v-card>
    <v-card-title> Level {{ level.identifier }} </v-card-title>
    <v-card-text>
      <template v-if="stepNumber === -1">
        <div v-html="level.level_intro_message" />
        <v-btn @click="stepNumber = 0">
          Start
        </v-btn>
      </template>
      <template v-if="stepNumber >= 0 && stepNumber < stepCount">
        <p>Step {{ stepNumber + 1 }} out of {{ stepCount }}</p>
        <Diff
          :source1="currentStep.file1_content"
          :source2="currentStep.file2_content"
        />
        <Questions :questions="currentStep.questions" @submit="submit" />
      </template>
      <template v-if="stepNumber >= stepCount">
        <div v-html="level.level_conclusion_message" />

        <v-btn to="/">
          Back to Menu
        </v-btn>
      </template>
    </v-card-text>
  </v-card>
</template>

<script>
import Diff from './diff'
import Questions from './questions'
import { saveResult, getStatus } from '../services/api'
import Vue from 'vue'

const NOT_STARTED = -1

export default {
  components: { Diff, Questions },
  props: {
    level: Object
  },
  data: () => ({
    status: {},
    stepNumber: NOT_STARTED
  }),
  computed: {
    currentStep() {
      return this.level.steps[this.stepNumber]
    },
    stepCount() {
      return this.level.steps.length
    }
  },
  mounted() {
    getStatus()
      .then(data => Vue.set(this, 'status', data.status))
      .then(() => (this.stepNumber = this.status.stepNumber || NOT_STARTED))
  },
  methods: {
    submit(answerIds) {
      saveResult(this.currentStep.id, answerIds).then(
        () => (this.stepNumber += 1)
      )
    }
  }
}
</script>
