import { prisma } from '../../lib/prisma';
import type { NextApiRequest, NextApiResponse } from "next";

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse
) {
  if (req.method === "POST") {
    const { name, email } = req.body;
    const user = await prisma.user.create({ data: { name, email } });
    return res.status(201).json(user);
  }
  res.status(405).json({ message: "Method Not Allowed" });
}
