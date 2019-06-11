<template>
  <v-stepper v-model="progress">
    <v-stepper-header>
      <v-stepper-step
        v-for="(question, i) in questions"
        :key="`${question.text} step ${i}`"
        :step="i + 1"
        :complete="answers[i] != undefined"
        style="cursor: pointer"
        @click="progress = i + 1"
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
            <v-radio-group v-model="answers[i]" :disabled="question.done">
              <v-radio
                v-for="(answer, j) in question.answers"
                :key="`${question.text} ${answer.text} content ${j}`"
                :label="answer.text"
                :value="answer.id"
              />
            </v-radio-group>
            <v-text-field v-model="comments[i]" />
          </v-card-text>

          <v-card-actions>
            <v-btn :disabled="i < 1" @click="progress = i">
              Back
            </v-btn>
            <v-btn v-if="i < questions.length - 1" @click="progress = i + 2">
              Next
            </v-btn>
            <v-btn
              v-else
              :disabled="
                questions.some((_, index) => typeof answers[index] !== 'number')
              "
              color="primary"
              @click="$emit('submit', answers, comments)"
            >
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
    answers: [],
    comments: []
  }),
  watch: {
    questions() {
      this.progress = 1
      this.answers = []
    }
  }
}
</script>
