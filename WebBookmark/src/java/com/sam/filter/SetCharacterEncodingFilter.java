package com.sam.filter;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 *
 * @author sam
 */
public class SetCharacterEncodingFilter implements Filter {
    

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private String encoding = null;
    private FilterConfig filterConfig = null;
    private boolean ignore = true;

    @Override
    public void destroy(){
        this.encoding = null;
        this.filterConfig = null;
    }
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        
        if(ignore || (request.getCharacterEncoding() == null)){
            String encoding = this.encoding;
            if(encoding != null){
                request.setCharacterEncoding(encoding);
            }
        }
        chain.doFilter(request, response);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {        
        this.filterConfig = filterConfig;
        this.encoding = filterConfig.getInitParameter("encoding");
        String value = filterConfig.getInitParameter("ignore");
        
        if(value == null){
            this.ignore = true;
        }else if(value.equalsIgnoreCase("true")){
            this.ignore = true;
        }else if(value.equalsIgnoreCase("yes")){
            this.ignore = true;
        }else{
            this.ignore = false;
        }
    }
    
}
