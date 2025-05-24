'use client';
import { useState } from 'react';

export default function Page() {
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');

  const submit = async () => {
    await fetch('/api/users', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ name, email }),
    });
  };

  return (
    <div>
      <input onChange={e => setName(e.target.value)} />
      <input onChange={e => setEmail(e.target.value)} />
      <button onClick={submit}>Crear</button>
    </div>
  );
}
