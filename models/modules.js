const { PrismaClient, Prisma } = require('@prisma/client');
const prisma = new PrismaClient();

// Create example
module.exports.create = function create(code, name, credit) {
    return prisma.module.create({
        //TODO: Add data      
        data: {
            modCode: code,
            modName: name,
            creditUnit: parseInt(credit)
        }
    }).then(function (module) {
        //TODO: Return module
        return module;
    }).catch(function (error) {
        // Prisma error codes: https://www.prisma.io/docs/orm/reference/errorreference#p2002             
        // // TODO: Handle Prisma Error, throw a new error if module already exists     
        if (error instanceof Prisma.PrismaClientKnownRequestError) {
            if (error.code === 'P2002') {
                throw new Error(`The Module ${code} already exists`);
            }
        }
        throw error;
    });
};

module.exports.updateByCode = function updateByCode(code, credit) {
    return prisma.module.update({
        //TODO: Add where and data        
        where: {
            modCode: code
        },
        data: {
            creditUnit: parseInt(credit)
        }
    }).then(function (module) {
        // Leave blank     
    }).catch(function (error) {
        if (error instanceof Prisma.PrismaClientKnownRequestError) {
            if (error.code === 'P2025') {
                throw new Error(`The Module ${code} does not exist`);
            }
        }
        throw error;
    });
}

module.exports.deleteByCode = function deleteByCode(code, credit) {
    return prisma.module.delete({
        //TODO: Add where        
        where: {
            modCode: code
        }
    }).then(function (module) {
        // Leave blank     
    }).catch(function (error) {
        if (error instanceof Prisma.PrismaClientKnownRequestError) {
            if (error.code === 'P2025') {
                throw new Error(`The Module ${code} does not exist`);
            }
        }
        throw error;
    });
}


module.exports.retrieveAll = function retrieveAll() {
    // TODO: Return all modules  
    return prisma.module.findMany()
};


module.exports.retrieveByCode = function retrieveByCode(code) {
    return prisma.module.findUnique({
        //TODO: Add where        
        where: {
            modCode: code
        }
    }).then(function (module) {
        return module
    }).catch(function (error) {
        if (error instanceof Prisma.PrismaClientKnownRequestError) {
            if (error.code === 'P2025') {
                throw new Error(`The Module ${code} does not exist`);
            }
        }
        throw error;
    });
}

// -----------------------------------------------------------------------------------------------------------
// Chatgtp Examples EXTRAAA
module.exports.createMany = function createMany(modules) {
    return prisma.module.createMany({
        data: modules.map((mod) => ({
            modCode: mod.code,
            modName: mod.name,
            creditUnit: parseInt(mod.credit)
        })),
        skipDuplicates: true // avoids error if same modCode already exists
    }).then(function (result) {
        return result;
    }).catch(function (error) {
        throw error;
    });
};

// createMany([
//     { code: "CS101", name: "Intro to CS", credit: 3 },
//     { code: "MA101", name: "Math 1", credit: 4 },
// ])

module.exports.updateMany = function updateMany(oldCredit, newCredit) {
    return prisma.module.updateMany({
        where: {
            creditUnit: parseInt(oldCredit)
        },
        data: {
            creditUnit: parseInt(newCredit)
        }
    }).then(function (result) {
        return result;
    }).catch(function (error) {
        throw error;
    });
};

// updateMany(3, 5) // Update all modules with creditUnit = 3 to creditUnit = 5

//Upsert - update module if exists, create one if doesnt
module.exports.upsertByCode = function upsertByCode(code, name, credit) {
    return prisma.module.upsert({
        where: {
            modCode: code
        },
        update: {
            modName: name,
            creditUnit: parseInt(credit)
        },
        create: {
            modCode: code,
            modName: name,
            creditUnit: parseInt(credit)
        }
    }).then(function (result) {
        return result;
    }).catch(function (error) {
        throw error;
    });
};


// upsertByCode("CS105", "Advanced CS", 4)


module.exports.deleteMany = function deleteMany(credit) {
    return prisma.module.deleteMany({
        where: {
            creditUnit: parseInt(credit)
        }
    }).then(function (result) {
        return result;
    }).catch(function (error) {
        throw error;
    });
};

// deleteMany(1) // Deletes all modules with creditUnit = 1
