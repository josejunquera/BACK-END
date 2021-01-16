const cars = [
  {
    id: 1,
    brand: "Seat",
    model: "Ibiza",
    year: 2018,
  },
  {
    id: 2,
    brand: "Mercedes",
    model: "AMG",
    year: 2017,
  },
  {
    id: 3,
    brand: "VW",
    model: "Golf",
    year: 2015,
  },
  {
    id: 4,
    brand: "VW",
    model: "Passat",
    year: 2016,
  },
  {
    id: 5,
    brand: "Renault",
    model: "5 Copa Turbo",
    year: 1997,
  },
];

function create(car) {
  const id = Math.max(...cars.map((car) => car.id)) + 1;

  const newCar = {
    id,
    ...car,
  };
  cars.push(newCar);

  return newCar;
}

function findAll() {
  return cars;
}

function findById(id) {
  return cars.find((car) => car.id === id);
}

function deleteById(id) {
  const car = findById(id);
  const index = cars.indexOf(car);
  cars.splice(index, 1);
  return cars;
}

module.exports = {
  findAll,
  findById,
  create,
  deleteById,
};
