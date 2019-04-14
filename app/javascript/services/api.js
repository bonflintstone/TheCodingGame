let token = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
let headers = {
  'Content-type': 'application/json',
  'X-CSRF-Token': token
}

export const getLevels = () =>
  fetch('/api/levels').then(response => response.json())

export const getLevel = id =>
  fetch(`/api/levels/${id}`).then(response => response.json())

export const getStatus = () =>
  fetch('/api/status').then(response => response.json())

export const saveResult = (step_id, answer_ids) => {
  fetch('/api/results', {
    headers,
    method: 'POST',
    body: JSON.stringify({ step_id, answer_ids }),
    credentials: 'same-origin'
  })
}
