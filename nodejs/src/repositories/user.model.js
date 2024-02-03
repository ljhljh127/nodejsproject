const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

//db 상호작용중 발생하는 에러를 모두 errorhandler로 던지기 위함
async function dbHandling(_func) {
    try {
        return await _func(prisma);
    } catch (error) {
        console.error(error);
        throw error;  // 에러 던지기 호출부에
    } finally {
        await prisma.$disconnect();
    }
}