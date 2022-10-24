export default (sequelize, DataTypes) => {
  const User = sequelize.define(
    'user',
    {
      firstname: DataTypes.STRING,
      lastname: DataTypes.STRING,
      username: DataTypes.STRING,
      phone_no: { type: DataTypes.STRING, unique: true },
      email: { type: DataTypes.STRING, unique: true },
      password: DataTypes.STRING,
      role: DataTypes.STRING,
    },
    {}
  );

  User.associate = function (models) {
    // associations go here
  };

  return User;
};
