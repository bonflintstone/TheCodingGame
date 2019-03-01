<template>
  <v-card>
    <v-card-title> Level {{ this.level.name }} </v-card-title>
    <v-card-text>
      <Diff
        :source1="currentStep.file1_content"
        :source2="currentStep.file2_content"
      />
      <Questions :questions="currentStep.questions" />
    </v-card-text>
  </v-card>
</template>

<script>
import Diff from './diff'
import Questions from './questions'

export default {
  components: { Diff, Questions },
  props: {
    level: Object
  },
  data: () => ({
    stepNumber: 0
  }),
  computed: {
    currentStep() {
      return this.level.steps[0]
    }
  }
}
</script>
