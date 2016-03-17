package robotics.signUpClass;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(schema="test", name="signedUpClass")
public class SignUpClass{
	@EmbeddedId
	private SignUp s;

	public SignUp getS() {
		return s;
	}

	public void setS(SignUp s) {
		this.s = s;
	}	
	
}
