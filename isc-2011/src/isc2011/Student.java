package isc2011;

import java.util.Date;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
import com.google.appengine.api.users.User;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Student {
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Long id;

    @Persistent
    private String name;
	
	@Persistent
    private String center;
	
	
	
    @Persistent
    private String roll;
	
	
	@Persistent
	private String school;
	
    public Student(String name,String school,String center, String roll) {
		this.roll=roll;
		this.center=center;		
		this.school=school;		
        this.name=name;
		
    }

	
	public String getName() {
        return  name;
    }
	
	
	public String getRoll() {
        return  roll;
    }
	
	
	public String getCenter() {
        return  center;
    }
	
	public String getSchool() {
        return  school;
    }
	
	
	
	
	public void setRoll(String roll) {
        this.roll=roll;
    }
	
		
	public void setCenter(String center) {
        this.center=center;
    }

	
	public void setName(String name) {
        this.name=name;
		}
}
