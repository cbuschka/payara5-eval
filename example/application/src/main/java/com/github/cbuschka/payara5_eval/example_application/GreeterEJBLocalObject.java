package com.github.cbuschka.payara5_eval.example_application;

import javax.ejb.EJBLocalObject;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;

public interface GreeterEJBLocalObject extends EJBLocalObject {
    String getMessage();
}
