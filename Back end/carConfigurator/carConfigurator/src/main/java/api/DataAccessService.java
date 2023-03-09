package api;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.management.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
//import org.springframework.data.relational.core.sql.Select;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;

import exception.APIException;
import exception.APIRequestException;
import model.ConfiguratedCar;
import model.Engine;
import model.Paint;
import model.Rim;
import model.User;

@Repository
public class DataAccessService {
	Connection con;
	private JdbcTemplate jdbc;

	@Autowired
	public DataAccessService(JdbcTemplate jdbc) {
		this.jdbc = jdbc;
		try {
			con = jdbc.getDataSource().getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private User mapUserFromResultSet(ResultSet resultSet) throws SQLException {
		User user = new User(resultSet.getString("username"), resultSet.getInt("iduser"),
				resultSet.getString("password"));
		return user;
	}

	private Paint mapPaintFromResultSet(ResultSet resultSet) throws SQLException {

		Paint paint = new Paint(resultSet.getString("nume"), resultSet.getString("codVopsea"), resultSet.getInt("pret"),
				resultSet.getInt("idvopsea"));
		return paint;
	}

	private Rim mapRimFromResultSet(ResultSet resultSet) throws SQLException {
		Rim rim = new Rim(resultSet.getString("nume"), resultSet.getString("pathPoza"), resultSet.getInt("diametru"),
				resultSet.getInt("pret"), resultSet.getInt("idjanta"));
		return rim;
	}

	private Engine mapEngineFromResultSet(ResultSet resultSet) throws SQLException {
		Engine engine = new Engine(resultSet.getString("nume"), resultSet.getDouble("consum"), resultSet.getInt("pret"),
				resultSet.getInt("putere"), resultSet.getInt("cuplu"), resultSet.getInt("capacitate"),
				resultSet.getInt("idmotor"));
		return engine;
	}

	public User getUserFromUserID(int userID) throws SQLException {

		PreparedStatement queryString = con.prepareStatement("SELECT * FROM user WHERE user.iduser = ?");
		queryString.setInt(1, userID);

		ResultSet resultSet = queryString.executeQuery();
		List<User> users = null;
		while (resultSet.next()) {
			users.add(mapUserFromResultSet(resultSet));
		}
		if (users == null)
			return null;
		return users.get(0);
	}

	public User getUserFromUsername(String username) throws SQLException {

		PreparedStatement queryString = con.prepareStatement("SELECT * FROM user WHERE user.username = ?");
		queryString.setString(1, username);

		ResultSet resultSet = queryString.executeQuery();
		List<User> users = new ArrayList<>();
		while (resultSet.next()) {
			users.add(mapUserFromResultSet(resultSet));
		}
		if (users.size() == 0)
			return null;
		return users.get(0);
	}

	public List<Engine> getAllEngines() throws SQLException {
		PreparedStatement queryString = con.prepareStatement("SELECT * FROM motor");
		ResultSet resultSet = queryString.executeQuery();
		List<Engine> engines = new ArrayList<>();
		while (resultSet.next()) {
			engines.add(mapEngineFromResultSet(resultSet));
		}
		if (engines.size() == 0)
			return null;
		return engines;
	}

	public List<Paint> getAllPaints() throws SQLException {
		PreparedStatement queryString = con.prepareStatement("SELECT * FROM vopsea");
		ResultSet resultSet = queryString.executeQuery();
		List<Paint> paints = new ArrayList<>();
		while (resultSet.next()) {
			paints.add(mapPaintFromResultSet(resultSet));
		}
		if (paints.size() == 0)
			return null;
		return paints;
	}

	public List<Rim> getAllRims() throws SQLException {
		PreparedStatement queryString = con.prepareStatement("SELECT * FROM janta");
		ResultSet resultSet = queryString.executeQuery();
		List<Rim> rims = new ArrayList<>();
		while (resultSet.next()) {
			rims.add(mapRimFromResultSet(resultSet));
		}
		if (rims.size() == 0)
			return null;
		return rims;
	}

	public List<ConfiguratedCar> getAllCarsFromAUser(int userID) throws SQLException {
		PreparedStatement queryString = con.prepareStatement(
				"SELECT idmasina_configurata, jantaID, vopseaID, motorID FROM masina_configurata as masina INNER JOIN set_masini ON masina.idmasina_configurata = set_masini.masina_configurataID "
						+
						/* "INNER JOIN motor WHERE masina.motorID = motor.idmotor " + */
						"INNER JOIN user WHERE set_masini.userID = iduser AND iduser = ?");
		queryString.setInt(1, userID);

		ResultSet resultSet = queryString.executeQuery();
		System.out.println(resultSet);
		List<ConfiguratedCar> configuratedCars = new ArrayList<>();
		while (resultSet.next()) {
			// get paint
			int paintID = resultSet.getInt("vopseaID");
			queryString = con.prepareStatement("SELECT * FROM vopsea WHERE vopsea.idvopsea = ?");
			queryString.setInt(1, paintID);
			System.out.println(paintID);
			System.out.println(queryString);
			ResultSet resultSet2 = queryString.executeQuery();
			resultSet2.next();
			System.out.println(queryString);
			System.out.println(resultSet2);
			Paint paint = mapPaintFromResultSet(resultSet2);

			// get rim

			int rimID = resultSet.getInt("jantaID");
			queryString = con.prepareStatement("SELECT * FROM janta WHERE janta.idjanta = ?");
			queryString.setInt(1, rimID);
			resultSet2 = queryString.executeQuery();
			resultSet2.next();
			Rim rim = mapRimFromResultSet(resultSet2);

			// get engine

			int engineID = resultSet.getInt("motorID");
			queryString = con.prepareStatement("SELECT * FROM motor WHERE motor.idmotor = ?");
			queryString.setInt(1, engineID);

			resultSet2 = queryString.executeQuery();
			resultSet2.next();
			Engine engine = mapEngineFromResultSet(resultSet2);

			ConfiguratedCar car = new ConfiguratedCar(engine, paint, rim);
			configuratedCars.add(car);
		}
		return configuratedCars;
	}

	public void addUser(String username, String password) throws SQLException {
		PreparedStatement queryString = con.prepareStatement("INSERT INTO user (USERNAME, PASSWORD) VALUES(?,?)");
		queryString.setString(1, username);
		queryString.setString(2, password);

		int rowsAffected = queryString.executeUpdate();
	}

	public void addConfiguredCar(String username, int rimID, int paintID, int engineID) throws SQLException {
		ResultSet resultSet = null;
		PreparedStatement queryString = con.prepareStatement(
				"INSERT INTO masina_configurata (jantaID, vopseaID, motorID) VALUES(?,?,?)",
				Statement.RETURN_GENERATED_KEYS);
		queryString.setInt(1, rimID);
		queryString.setInt(2, paintID);
		queryString.setInt(3, engineID);

		int rowsAffected = queryString.executeUpdate();
		resultSet = queryString.getGeneratedKeys();
		int id = 0;
		if (resultSet.next()) {
			id = resultSet.getInt(1);
		}
		System.out.println(id);
		queryString = con.prepareStatement("INSERT INTO set_masini (userID, masina_configurataID) VALUES(?,?)");
		User user = getUserFromUsername(username);
		if (user == null) {
			throw new APIRequestException(HttpStatus.BAD_REQUEST, "User not found");
		}
		queryString.setInt(1, user.getUserID());
		queryString.setInt(2, id);
		rowsAffected = queryString.executeUpdate();
	}
}
