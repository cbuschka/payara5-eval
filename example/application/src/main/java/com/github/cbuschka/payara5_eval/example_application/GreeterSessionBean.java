package com.github.cbuschka.payara5_eval.example_application;

import javax.ejb.*;
import java.rmi.RemoteException;

public class GreeterSessionBean implements SessionBean {

    private transient SessionContext sessionContext;

    public GreeterSessionBean() {
    }

    public void ejbCreate() throws CreateException {
    }

    @Override
    public void setSessionContext(SessionContext sessionContext) throws EJBException, RemoteException {
        this.sessionContext = sessionContext;
    }

    @Override
    public void ejbRemove() throws EJBException, RemoteException {

    }

    @Override
    public void ejbActivate() throws EJBException, RemoteException {

    }

    @Override
    public void ejbPassivate() throws EJBException, RemoteException {

    }

    public String getMessage() {
        return "Hello world!";
    }
}
