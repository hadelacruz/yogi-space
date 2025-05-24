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
npm install
```

3. Configure your database connection by copying the `.env.example`:

```bash
cp .env.example .env
```

4. Start DB:

```bash
npm run setup:db
```

5. Generate schema.sql:

```bash
npm run generate:schema
```

6. Insert data :

>[!IMPORTANT]
>Run the data.sql file (attached in the delivery) in the database created above (pgAdmin)

7. Open [http://localhost:3000](http://localhost:3000) in your browser


## Tech Stack

- **Frontend-Backend**: Next.js
- **Database**: PostgreSQL (ORM prisma)

validation
- **Styling**: Tailwind CSS
