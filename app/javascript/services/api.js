const levels = [
  {
    id: 1,
    name: 'First Level',
    stages: [
      {
        source1: 'Some text\nTo compare',
        source2: 'Some text\nTo diff',
        questions: [
          {
            text: 'Does the change make it better?',
            choices: [{ text: 'Yes' }, { text: 'No' }, { text: 'Who Cares' }]
          },
          {
            text: 'How many lines are there in total?',
            choices: [{ text: '1' }, { text: '2' }, { text: '3' }]
          }
        ]
      },
      {
        source1: 'Other text here',
        source2: 'Different\nline length',
        questions: [
          {
            text: 'Does the change make it better?',
            choices: [{ text: 'Yes' }, { text: 'No' }, { text: 'Who Cares' }]
          },
          {
            text: 'How many lines are there in total?',
            choices: [{ text: '1' }, { text: '2' }, { text: '3' }]
          }
        ]
      }
    ]
  },
  {
    id: 2,
    name: 'level 2 baby',
    stages: [
      {
        source1: 'Ahahahahhah',
        source2: 'Xaxaxaxaxa',
        questions: [
          {
            text: 'What language did the coder change to?',
            choices: [{ text: 'English' }, { text: 'Russian' }]
          }
        ]
      }
    ]
  }
]

export const getLevels = () =>
  new Promise((resolve, reject) =>
    resolve(levels.map(level => ({ id: level.id, name: level.name })))
  )

export const getLevel = id =>
  new Promise((resolve, reject) =>
    resolve(levels.find(level => level.id == id))
  )
