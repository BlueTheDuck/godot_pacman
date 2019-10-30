var nodes = [
    { "pos": { "x": 14, "y": 52 }, "free": [false, true, true, false], "connections": [-1, { "id": 1, "weight": 0 }, { "id": 62, "weight": 349 }, -1] },
    { "pos": { "x": 74, "y": 52 }, "free": [false, true, true, true], "connections": [-1, { "id": 2, "weight": 0 }, { "id": 54, "weight": 311 }, { "id": 0, "weight": 0 }] },
    { "pos": { "x": 146, "y": 52 }, "free": [false, false, true, true], "connections": [-1, -1, { "id": 63, "weight": 349 }, { "id": 1, "weight": 0 }] },
    { "pos": { "x": 182, "y": 52 }, "free": [false, true, true, false], "connections": [-1, { "id": 4, "weight": 0 }, { "id": 64, "weight": 349 }, -1] },
    { "pos": { "x": 254, "y": 52 }, "free": [false, true, true, true], "connections": [-1, { "id": 5, "weight": 0 }, { "id": 59, "weight": 311 }, { "id": 3, "weight": 0 }] },
    { "pos": { "x": 314, "y": 52 }, "free": [false, false, true, true], "connections": [-1, -1, { "id": 65, "weight": 349 }, { "id": 4, "weight": 0 }] },
    { "pos": { "x": 14, "y": 102 }, "free": [true, true, true, false], "connections": [{ "id": 0, "weight": 50 }, { "id": 7, "weight": 0 }, { "id": 62, "weight": 299 }, -1] },
    { "pos": { "x": 74, "y": 102 }, "free": [true, true, true, true], "connections": [{ "id": 1, "weight": 50 }, { "id": 8, "weight": 0 }, { "id": 54, "weight": 261 }, { "id": 6, "weight": 0 }] },
    { "pos": { "x": 110, "y": 102 }, "free": [false, true, true, true], "connections": [-1, { "id": 9, "weight": 0 }, { "id": 55, "weight": 261 }, { "id": 7, "weight": 0 }] },
    { "pos": { "x": 146, "y": 102 }, "free": [true, true, false, true], "connections": [{ "id": 2, "weight": 50 }, { "id": 10, "weight": 0 }, -1, { "id": 8, "weight": 0 }] },
    { "pos": { "x": 182, "y": 102 }, "free": [true, true, false, true], "connections": [{ "id": 3, "weight": 50 }, { "id": 11, "weight": 0 }, -1, { "id": 9, "weight": 0 }] },
    { "pos": { "x": 218, "y": 102 }, "free": [false, true, true, true], "connections": [-1, { "id": 12, "weight": 0 }, { "id": 58, "weight": 261 }, { "id": 10, "weight": 0 }] },
    { "pos": { "x": 254, "y": 102 }, "free": [true, true, true, true], "connections": [{ "id": 4, "weight": 50 }, { "id": 13, "weight": 0 }, { "id": 59, "weight": 261 }, { "id": 11, "weight": 0 }] },
    { "pos": { "x": 314, "y": 102 }, "free": [true, false, true, true], "connections": [{ "id": 5, "weight": 50 }, -1, { "id": 65, "weight": 299 }, { "id": 12, "weight": 0 }] },
    { "pos": { "x": 14, "y": 139 }, "free": [true, true, false, false], "connections": [{ "id": 6, "weight": 37 }, { "id": 15, "weight": 0 }, -1, -1] },
    { "pos": { "x": 74, "y": 139 }, "free": [true, false, true, true], "connections": [{ "id": 7, "weight": 37 }, -1, { "id": 54, "weight": 224 }, { "id": 14, "weight": 0 }] },
    { "pos": { "x": 110, "y": 139 }, "free": [true, true, false, false], "connections": [{ "id": 8, "weight": 37 }, { "id": 17, "weight": 0 }, -1, -1] },
    { "pos": { "x": 146, "y": 139 }, "free": [false, false, true, true], "connections": [{ "id": 2, "weight": 87 }, -1, { "id": 63, "weight": 262 }, { "id": 16, "weight": 0 }] },
    { "pos": { "x": 182, "y": 139 }, "free": [false, true, true, false], "connections": [{ "id": 3, "weight": 87 }, { "id": 19, "weight": 0 }, { "id": 64, "weight": 262 }, -1] },
    { "pos": { "x": 218, "y": 139 }, "free": [true, false, false, true], "connections": [{ "id": 11, "weight": 37 }, -1, -1, { "id": 18, "weight": 0 }] },
    { "pos": { "x": 254, "y": 139 }, "free": [true, true, true, false], "connections": [{ "id": 12, "weight": 37 }, { "id": 21, "weight": 0 }, { "id": 59, "weight": 224 }, -1] },
    { "pos": { "x": 314, "y": 139 }, "free": [true, false, false, true], "connections": [{ "id": 13, "weight": 37 }, -1, -1, { "id": 20, "weight": 0 }] },
    { "pos": { "x": 110, "y": 177 }, "free": [false, true, true, false], "connections": [{ "id": 8, "weight": 75 }, { "id": 23, "weight": 0 }, { "id": 55, "weight": 186 }, -1] },
    { "pos": { "x": 146, "y": 177 }, "free": [true, true, false, true], "connections": [{ "id": 17, "weight": 38 }, { "id": 24, "weight": 0 }, -1, { "id": 22, "weight": 0 }] },
    { "pos": { "x": 182, "y": 177 }, "free": [true, true, false, true], "connections": [{ "id": 18, "weight": 38 }, { "id": 25, "weight": 0 }, -1, { "id": 23, "weight": 0 }] },
    { "pos": { "x": 218, "y": 177 }, "free": [false, false, true, true], "connections": [{ "id": 11, "weight": 75 }, -1, { "id": 58, "weight": 186 }, { "id": 24, "weight": 0 }] },
    { "pos": { "x": 14, "y": 214 }, "free": [false, true, false, false], "connections": [{ "id": 6, "weight": 112 }, { "id": 27, "weight": 0 }, -1, -1] },
    { "pos": { "x": 74, "y": 214 }, "free": [true, true, true, true], "connections": [{ "id": 15, "weight": 75 }, { "id": 28, "weight": 0 }, { "id": 54, "weight": 149 }, { "id": 26, "weight": 0 }] },
    { "pos": { "x": 110, "y": 214 }, "free": [true, false, true, true], "connections": [{ "id": 22, "weight": 37 }, -1, { "id": 55, "weight": 149 }, { "id": 27, "weight": 0 }] },
    { "pos": { "x": 218, "y": 214 }, "free": [true, true, true, false], "connections": [{ "id": 25, "weight": 37 }, { "id": 30, "weight": 0 }, { "id": 58, "weight": 149 }, -1] },
    { "pos": { "x": 254, "y": 214 }, "free": [true, true, true, true], "connections": [{ "id": 20, "weight": 75 }, { "id": 31, "weight": 0 }, { "id": 59, "weight": 149 }, { "id": 29, "weight": 0 }] },
    { "pos": { "x": 314, "y": 214 }, "free": [false, false, false, true], "connections": [{ "id": 13, "weight": 112 }, -1, -1, { "id": 30, "weight": 0 }] },
    { "pos": { "x": 110, "y": 251 }, "free": [true, true, true, false], "connections": [{ "id": 28, "weight": 37 }, { "id": 33, "weight": 0 }, { "id": 55, "weight": 112 }, -1] },
    { "pos": { "x": 218, "y": 251 }, "free": [true, false, true, true], "connections": [{ "id": 29, "weight": 37 }, -1, { "id": 58, "weight": 112 }, { "id": 32, "weight": 0 }] },
    { "pos": { "x": 14, "y": 289 }, "free": [false, true, true, false], "connections": [{ "id": 6, "weight": 187 }, { "id": 35, "weight": 0 }, { "id": 62, "weight": 112 }, -1] },
    { "pos": { "x": 74, "y": 289 }, "free": [true, true, true, true], "connections": [{ "id": 27, "weight": 75 }, { "id": 36, "weight": 0 }, { "id": 54, "weight": 74 }, { "id": 34, "weight": 0 }] },
    { "pos": { "x": 110, "y": 289 }, "free": [true, true, false, true], "connections": [{ "id": 32, "weight": 38 }, { "id": 37, "weight": 0 }, -1, { "id": 35, "weight": 0 }] },
    { "pos": { "x": 146, "y": 289 }, "free": [false, false, true, true], "connections": [{ "id": 17, "weight": 150 }, -1, { "id": 63, "weight": 112 }, { "id": 36, "weight": 0 }] },
    { "pos": { "x": 182, "y": 289 }, "free": [false, true, true, false], "connections": [{ "id": 18, "weight": 150 }, { "id": 39, "weight": 0 }, { "id": 64, "weight": 112 }, -1] },
    { "pos": { "x": 218, "y": 289 }, "free": [true, true, false, true], "connections": [{ "id": 33, "weight": 38 }, { "id": 40, "weight": 0 }, -1, { "id": 38, "weight": 0 }] },
    { "pos": { "x": 254, "y": 289 }, "free": [true, true, true, true], "connections": [{ "id": 30, "weight": 75 }, { "id": 41, "weight": 0 }, { "id": 59, "weight": 74 }, { "id": 39, "weight": 0 }] },
    { "pos": { "x": 314, "y": 289 }, "free": [false, false, true, true], "connections": [{ "id": 13, "weight": 187 }, -1, { "id": 65, "weight": 112 }, { "id": 40, "weight": 0 }] },
    { "pos": { "x": 14, "y": 326 }, "free": [true, true, false, false], "connections": [{ "id": 34, "weight": 37 }, { "id": 43, "weight": 0 }, -1, -1] },
    { "pos": { "x": 38, "y": 326 }, "free": [false, false, true, true], "connections": [-1, -1, { "id": 53, "weight": 37 }, { "id": 42, "weight": 0 }] },
    { "pos": { "x": 74, "y": 326 }, "free": [true, true, true, false], "connections": [{ "id": 35, "weight": 37 }, { "id": 45, "weight": 0 }, { "id": 54, "weight": 37 }, -1] },
    { "pos": { "x": 110, "y": 326 }, "free": [false, true, true, true], "connections": [{ "id": 32, "weight": 75 }, { "id": 46, "weight": 0 }, { "id": 55, "weight": 37 }, { "id": 44, "weight": 0 }] },
    { "pos": { "x": 146, "y": 326 }, "free": [true, true, false, true], "connections": [{ "id": 37, "weight": 37 }, { "id": 47, "weight": 0 }, -1, { "id": 45, "weight": 0 }] },
    { "pos": { "x": 182, "y": 326 }, "free": [true, true, false, true], "connections": [{ "id": 38, "weight": 37 }, { "id": 48, "weight": 0 }, -1, { "id": 46, "weight": 0 }] },
    { "pos": { "x": 218, "y": 326 }, "free": [false, true, true, true], "connections": [{ "id": 33, "weight": 75 }, { "id": 49, "weight": 0 }, { "id": 58, "weight": 37 }, { "id": 47, "weight": 0 }] },
    { "pos": { "x": 254, "y": 326 }, "free": [true, false, true, true], "connections": [{ "id": 40, "weight": 37 }, -1, { "id": 59, "weight": 37 }, { "id": 48, "weight": 0 }] },
    { "pos": { "x": 290, "y": 326 }, "free": [false, true, true, false], "connections": [-1, { "id": 51, "weight": 0 }, { "id": 60, "weight": 37 }, -1] },
    { "pos": { "x": 314, "y": 326 }, "free": [true, false, false, true], "connections": [{ "id": 41, "weight": 37 }, -1, -1, { "id": 50, "weight": 0 }] },
    { "pos": { "x": 14, "y": 363 }, "free": [false, true, true, false], "connections": [{ "id": 34, "weight": 74 }, { "id": 53, "weight": 0 }, { "id": 62, "weight": 38 }, -1] },
    { "pos": { "x": 38, "y": 363 }, "free": [true, true, false, true], "connections": [{ "id": 43, "weight": 37 }, { "id": 54, "weight": 0 }, -1, { "id": 52, "weight": 0 }] },
    { "pos": { "x": 74, "y": 363 }, "free": [true, false, false, true], "connections": [{ "id": 44, "weight": 37 }, -1, -1, { "id": 53, "weight": 0 }] },
    { "pos": { "x": 110, "y": 363 }, "free": [true, true, false, false], "connections": [{ "id": 45, "weight": 37 }, { "id": 56, "weight": 0 }, -1, -1] },
    { "pos": { "x": 146, "y": 363 }, "free": [false, false, true, true], "connections": [{ "id": 37, "weight": 74 }, -1, { "id": 63, "weight": 38 }, { "id": 55, "weight": 0 }] },
    { "pos": { "x": 182, "y": 363 }, "free": [false, true, true, false], "connections": [{ "id": 38, "weight": 74 }, { "id": 58, "weight": 0 }, { "id": 64, "weight": 38 }, -1] },
    { "pos": { "x": 218, "y": 363 }, "free": [true, false, false, true], "connections": [{ "id": 48, "weight": 37 }, -1, -1, { "id": 57, "weight": 0 }] },
    { "pos": { "x": 254, "y": 363 }, "free": [true, true, false, false], "connections": [{ "id": 49, "weight": 37 }, { "id": 60, "weight": 0 }, -1, -1] },
    { "pos": { "x": 290, "y": 363 }, "free": [true, true, false, true], "connections": [{ "id": 50, "weight": 37 }, { "id": 61, "weight": 0 }, -1, { "id": 59, "weight": 0 }] },
    { "pos": { "x": 314, "y": 363 }, "free": [false, false, true, true], "connections": [{ "id": 41, "weight": 74 }, -1, { "id": 65, "weight": 38 }, { "id": 60, "weight": 0 }] },
    { "pos": { "x": 14, "y": 401 }, "free": [true, true, false, false], "connections": [{ "id": 52, "weight": 38 }, { "id": 63, "weight": 0 }, -1, -1] },
    { "pos": { "x": 146, "y": 401 }, "free": [true, true, false, true], "connections": [{ "id": 56, "weight": 38 }, { "id": 64, "weight": 0 }, -1, { "id": 62, "weight": 0 }] },
    { "pos": { "x": 182, "y": 401 }, "free": [true, true, false, true], "connections": [{ "id": 57, "weight": 38 }, { "id": 65, "weight": 0 }, -1, { "id": 63, "weight": 0 }] },
    { "pos": { "x": 314, "y": 401 }, "free": [true, false, false, true], "connections": [{ "id": 61, "weight": 38 }, -1, -1, { "id": 64, "weight": 0 }] }]
const UP = 0;
const RIGHT = 1;
const DOWN = 2;
const LEFT = 3;

function Vector2(x, y) {
    this.x = x;
    this.y = y;
}

function StarPoint(id, weight) {
    return { "id": id, "weight": weight };
}

function findBellow(cur_y, start_i) {
    if (!(start_i instanceof Number && start_i > 0 && start_i < nodes.length)) {
        start_i = 0;
    }
    for (let i = start_i; i < nodes.length; i++) {
        if (nodes[i].pos.y > cur_y) {
            return i;
        }
    }
    return -1;
}

for (var i = 0; i < nodes.length - 1; i++) {
    if (nodes[i].free[RIGHT]) {
        if (nodes[i].pos.y == nodes[i + 1].pos.y) {
            let weight = Math.abs(nodes[i].pos.x - nodes[i].pos.x);
            nodes[i].connections[RIGHT] = StarPoint(i + 1, weight);
            nodes[i + 1].connections[LEFT] = StarPoint(i, weight);
        }
    }
    if (nodes[i].free[DOWN]) {
        for (let j = i + 1; j < nodes.length; j++) {
            if (nodes[i].pos.x == nodes[j].pos.x) {
                let weight = Math.abs(nodes[i].pos.y - nodes[j].pos.y);
                nodes[i].connections[DOWN] = StarPoint(j, weight);
                nodes[j].connections[UP] = StarPoint(i, weight);
            }
        }
    }
}

console.log(JSON.stringify(nodes));