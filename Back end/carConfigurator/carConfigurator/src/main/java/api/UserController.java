package api;

import java.io.Console;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.node.ObjectNode;

import exception.APIRequestException;
import model.ConfiguratedCar;
import model.Engine;
import model.Paint;
import model.Rim;
import model.User;

@RestController
@RequestMapping("api/users")
public class UserController extends BaseController {

	@Autowired
	private UserService userService;
	private DataAccessService dataAccessService;

	@Autowired
	private PasswordEncoder bcryptEncoder;

	@Autowired
	public UserController(UserService userService, DataAccessService dataAccessService) {
		this.userService = userService;
		this.dataAccessService = dataAccessService;
	}

	@GetMapping("/getBCryptOfString")
	public String getBCrypt(@RequestParam(name = "text") String text) {
		return bcryptEncoder.encode(text);
	}

	@GetMapping("/getEngines")
	public List<Engine> getEngines(@RequestHeader("Authorization") String authorization,
			@RequestParam(name = "username") String username) {
		verifyUserFromTokenAndIfLoggedIn(authorization, username);
		try {
			return userService.getEngines();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new APIRequestException(HttpStatus.INTERNAL_SERVER_ERROR, "Eroare din baza de date");
		}
	}

	@GetMapping("/getPaints")
	public List<Paint> getPaints(@RequestHeader("Authorization") String authorization,
			@RequestParam(name = "username") String username) {
		verifyUserFromTokenAndIfLoggedIn(authorization, username);
		try {
			return userService.getPaints();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new APIRequestException(HttpStatus.INTERNAL_SERVER_ERROR, "Eroare din baza de date");
		}
	}

	@GetMapping("/getRims")
	public List<Rim> getRims(@RequestHeader("Authorization") String authorization,
			@RequestParam(name = "username") String username) {
		verifyUserFromTokenAndIfLoggedIn(authorization, username);
		try {
			return userService.getRims();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new APIRequestException(HttpStatus.INTERNAL_SERVER_ERROR, "Eroare din baza de date");
		}
	}

	@PostMapping("/register")
	public ResponseEntity<String> addNewUser(@RequestBody ObjectNode objectNode) {
		if (objectNode.get("username") == null || objectNode.get("username").asText().length() == 0) {
			System.out.println(objectNode.get("username"));
			throw new APIRequestException(HttpStatus.BAD_REQUEST, "Username este empty");
		}
		if (objectNode.get("password") == null || objectNode.get("password").asText().length() == 0) {
			throw new APIRequestException(HttpStatus.BAD_REQUEST, "Password este empty");
		}
		if (objectNode.get("confirmPassword") == null || objectNode.get("confirmPassword").asText().length() == 0) {
			throw new APIRequestException(HttpStatus.BAD_REQUEST, "Confirm Password este empty");
		}

		User user;
		try {
			user = dataAccessService.getUserFromUsername(objectNode.get("username").asText());
		} catch (SQLException e1) {
			e1.printStackTrace();

			throw new APIRequestException(HttpStatus.INTERNAL_SERVER_ERROR, "Eroare din baza de date");
		}
		if (user != null) {
			throw new APIRequestException(HttpStatus.BAD_REQUEST, "Acest username este deja folosit");
		}

		if (objectNode.get("password").equals(objectNode.get("confirmPassword")) == false) {
			throw new APIRequestException(HttpStatus.BAD_REQUEST, "Parolele nu corespund");
		}

		try {
			userService.addNewUser(objectNode.get("username").asText(),
					bcryptEncoder.encode(objectNode.get("password").asText()));
		} catch (SQLException e) {
			e.printStackTrace();
			throw new APIRequestException(HttpStatus.INTERNAL_SERVER_ERROR, "Eroare din baza de date");
		}

		throw new APIRequestException(HttpStatus.OK, "User audaugat cu succes");
	}

	@PostMapping("/addConfiguredCar")
	public void addConfiguredCar(@RequestHeader("Authorization") String authorization,
			@RequestParam(name = "username") String username, @RequestParam(name = "rimID") int rimID,
			@RequestParam(name = "paintID") int paintID, @RequestParam(name = "engineID") int engineID)
			throws SQLException {
		verifyUserFromTokenAndIfLoggedIn(authorization, username);
		userService.addConfiguredCar(username, rimID, paintID, engineID);
	}

	@PostMapping("/verifyLogin")
	public ResponseEntity<String> verifyLogin(@RequestHeader("Authorization") String authorization,
			@RequestParam(name = "username") String username) {
		verifyUserFromTokenAndIfLoggedIn(authorization, username);
		throw new APIRequestException(HttpStatus.OK, "OK");
	}

	@GetMapping("/carsOfUser")
	public List<ConfiguratedCar> getCarsOfuser(@RequestHeader("Authorization") String authorization,
			@RequestParam(name = "username") String username) throws SQLException {
		User user = dataAccessService.getUserFromUsername(username);
		if (user == null) {
			throw new APIRequestException(HttpStatus.BAD_REQUEST, "User ul " + username + " nu a fost gasit");
		}

		verifyUserFromTokenAndIfLoggedIn(authorization, username);
		System.out.println(userService.getCarsOfUser(username));
		return userService.getCarsOfUser(username);
	}

}
