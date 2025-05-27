# YosiSpace

## Project Overview

YogiSpace es una moderna aplicación web diseñada para ayudar a los usuarios a gestionar y dar seguimiento a sus sesiones de yoga. La plataforma permite organizar clases, mantener registros de las sesiones e interactuar con una interfaz clara y ágil. Desarrollada con tecnologías web modernas.
## Getting Started

### Prerequisites

- Node.js 18.17 or later
- PostgreSQL database

### Installation

1. Clone the repository:

```bash
git clone https://https://github.com/hadelacruz/yogi-space 
```

2. Install dependencies:

```bash
npm install --legacy-peer-deps
```

3. Configure your database connection by copying the `.env.example`:

```bash
cp .env.example .env
```

4. Run DB migrations:

```bash
npx prisma migrate dev
```

5. Insert data :

>[!IMPORTANT]
>To test the project correctly, you must manually execute the prisma/data.sql file using pgAdmin or your preferred PostgreSQL database manager.

6. Open [http://localhost:3000](http://localhost:3000) in your browser


## Tech Stack

- **Frontend-Backend**: Next.js
- **Database**: PostgreSQL (ORM prisma)

validation
- **Styling**: Tailwind CSS
