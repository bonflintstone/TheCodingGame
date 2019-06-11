const token = document
  .querySelector('meta[name="csrf-token"]')
  .getAttribute('content')
const headers = {
  'Content-type': 'application/json',
  'X-CSRF-Token': token
}

export const getLevels = () =>
  fetch('/api/levels').then(response => response.json())

export const getLevel = id =>
  fetch(`/api/levels/${id}`).then(response => response.json())

export const getStatus = () =>
  fetch('/api/status').then(response => response.json())

export const saveResult = (step_id, answer_ids, comments) =>
  fetch('/api/results', {
    headers,
    method: 'POST',
    body: JSON.stringify({ step_id, answer_ids, comments }),
    credentials: 'same-origin'
  })
