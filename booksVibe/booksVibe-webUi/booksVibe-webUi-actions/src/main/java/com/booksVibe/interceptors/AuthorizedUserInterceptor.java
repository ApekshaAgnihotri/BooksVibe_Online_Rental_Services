package com.booksVibe.interceptors;

import java.util.Map;

import org.apache.log4j.Logger;

import com.booksVibe.models.UserBean;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

// TODO: Auto-generated Javadoc
/**
 * The Class AuthorizedUserInterceptor.
 */
public class AuthorizedUserInterceptor implements Interceptor {

    /** The Constant serialVersionUID. */
    private static final long serialVersionUID = 1L;

    /*
     * (non-Javadoc)
     * 
     * @see com.opensymphony.xwork2.interceptor.Interceptor#destroy()
     */
    public void destroy() {
        // TODO Auto-generated method stub

    }

    /*
     * (non-Javadoc)
     * 
     * @see com.opensymphony.xwork2.interceptor.Interceptor#init()
     */
    public void init() {
        // TODO Auto-generated method stub

    }

    /** The Constant LOGGER. */
    private static final Logger LOGGER = Logger.getLogger(AnnonymousUserInterceptor.class);

    /** The Constant INVALID_OPERATOR_ACCESS. */
    private static final String INVALID_ACCESS = "invalidAccess",INVALID_OPERATOR_ACCESS = "invalidOperatorAccess";

    /*
     * (non-Javadoc)
     * 
     * @see
     * com.opensymphony.xwork2.interceptor.Interceptor#intercept(com.opensymphony
     * .xwork2.ActionInvocation)
     */
    public String intercept(ActionInvocation invocation)  
    {
        // TODO Auto-generated method stub
        LOGGER.info("AUTHORIZED USER INTERCEPTOR");
        
        Map<String,Object> session = invocation.getInvocationContext().getSession();
        
        if (!session.containsKey("loggedUser")) {

            LOGGER.error("INVALID ACCESS ATTEMPT");
            return INVALID_ACCESS;
        }
        else 
        {
            UserBean user = (UserBean) session.get("loggedUser");
            if (user.getEmaild().equalsIgnoreCase("")) {

                LOGGER.error("INVALID ACCESS");
                return INVALID_ACCESS;
            }
            if (user.getRole().equals("admin") || user.getRole().equals("master")) {

                LOGGER.error("UNAUTHORIZED ACCESS BY ADMIN");
                return INVALID_OPERATOR_ACCESS;
            }

            LOGGER.info("authorized user - redirecting user request");
            try {
                invocation.invoke();
            }
            catch (Exception e) {
                // TODO Auto-generated catch block
            }
        }
        /* This return will be never invoked */
        return "";
    }

}
