package api;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.ConfiguratedCar;
import model.Engine;
import model.Paint;
import model.Rim;

@Service
public class UserService {

	@Autowired
	DataAccessService dataAccessService;

	@Autowired
	public UserService(DataAccessService dataAccessService) {
		this.dataAccessService = dataAccessService;
	}

	public List<ConfiguratedCar> getCarsOfUser(String username) throws SQLException {
		return dataAccessService.getAllCarsFromAUser(dataAccessService.getUserFromUsername(username).getUserID());
	}

	public void addNewUser(String username, String password) throws SQLException {
		dataAccessService.addUser(username, password);
	}

	public void addConfiguredCar(String username, int rimID, int paintID, int engineID) throws SQLException {
		dataAccessService.addConfiguredCar(username, rimID, paintID, engineID);
	}

	public List<Engine> getEngines() throws SQLException {
		return dataAccessService.getAllEngines();
	}

	public List<Paint> getPaints() throws SQLException {
		return dataAccessService.getAllPaints();
	}

	public List<Rim> getRims() throws SQLException {
		return dataAccessService.getAllRims();
	}
}
