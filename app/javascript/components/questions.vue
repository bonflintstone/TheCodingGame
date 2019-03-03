<template>
  <v-stepper v-model="progress">
    <v-stepper-header>
      <v-stepper-step
        v-for="(question, i) in questions"
        :key="`${question.text} step ${i}`"
        :step="i + 1"
        :complete="answers[i] != undefined"
        @click="progress = i + 1"
        style="cursor: pointer"
      >
        Question {{ i + 1 }}
      </v-stepper-step>
    </v-stepper-header>
    <v-stepper-items>
      <v-stepper-content
        v-for="(question, i) in questions"
        :key="`${question.text} content ${i}`"
        :step="i + 1"
      >
        <v-card>
          <v-card-title>
            {{ question.text }}
          </v-card-title>

          <v-card-text>
            <v-radio-group v-model="answers[i]">
              <v-radio
                v-for="(answer, i) in question.answers"
                :key="`${question.text} ${answer.text} content ${i}`"
                :label="answer.text"
                :value="answer.text"
              />
            </v-radio-group>
          </v-card-text>

          <v-card-actions>
            <v-btn :disabled="i < 1" @click="progress = i">Back</v-btn>
            <v-btn v-if="i < questions.length - 1" @click="progress = i + 2">
              Next
            </v-btn>
            <v-btn v-else color="primary" @click="$emit('submit', answers)">
              Submit
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-stepper-content>
    </v-stepper-items>
  </v-stepper>
</template>

<script>
export default {
  props: {
    questions: Array
  },
  data: () => ({
    progress: 1,
    answers: []
  }),
  watch: {
    questions() {
      this.progress = 1
      this.answers = []
    }
  }
}
</script>
