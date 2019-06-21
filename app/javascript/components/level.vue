<template>
  <v-card class="pa-5">
    <v-card-title>
      <h2>Level {{ level.identifier }}</h2>
    </v-card-title>
    <v-card-text>
      <template v-if="stepNumber === -1">
        <div v-html="level.level_intro_message" />
        <v-btn @click="stepNumber = 0">
          Start
        </v-btn>
      </template>
      <template v-if="stepNumber >= 0 && stepNumber < stepCount">
        <p>Step {{ stepNumber + 1 }} out of {{ stepCount }}</p>
        <v-switch v-model="unifiedDiff" label="Unified Diff View" />
        <Diff
          :fileName1="currentStep.file1_name"
          :fileName2="currentStep.file2_name"
          :source1="currentStep.file1_content"
          :source2="currentStep.file2_content"
          :unified="unifiedDiff"
        />
        <v-btn :href="currentStep.file1_clarification" target="_blank">
          Clarification for "Before"
        </v-btn>
        <v-btn :href="currentStep.file2_clarification" target="_blank">
          Clarification for "After"
        </v-btn>
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
    stepNumber: NOT_STARTED,
    unifiedDiff: false
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
    submit(answerIds, comments) {
      saveResult(this.currentStep.id, answerIds, comments).then(
        () => (this.stepNumber += 1)
      )
    }
  }
}
</script>
