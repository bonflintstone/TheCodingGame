<template>
  <v-stepper v-model="progress">
    <v-stepper-header>
      <v-stepper-step
        v-for="(question, i) in questions"
        :key="i"
        :step="i"
        :complete="question.chosen"
        @click="progress = i"
        style="cursor: pointer"
      >
        Question {{ i }}
      </v-stepper-step>
    </v-stepper-header>
    <v-stepper-items>
      <v-stepper-content v-for="(question, i) in questions" :key="i" :step="i">
        <v-card>
          <v-card-title>
            {{ question.text }}
          </v-card-title>

          <v-card-text>
            <v-radio-group v-model="question.chosen">
              <v-radio
                v-for="choice, i in question.choices"
                :key="i"
                :label="choice.text"
                :value="choice.text"
              />
            </v-radio-group>
          </v-card-text>

          <v-card-actions>
            <v-btn v-if="i !== 0" @click="progress = i - 1">Back</v-btn>
            <v-btn v-if="i < questions.length - 1" @click="progress = i + 1">
              Next
            </v-btn>
            <v-btn v-else color="primary" @click="">Submit</v-btn>
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
    progress: 0
  })
}
</script>
