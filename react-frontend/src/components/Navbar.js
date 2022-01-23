import React, {useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import './Navbar.css';
import { Button } from './Button';

function Navbar() { 
    const [click, setClick] = useState(false);
    const [button, setButton] = useState(true)

    const handleClick = () => setClick(!click);
    const closeMobileMenu = () => setClick(false);

    const showButton = () => {
        if(window.innerWidth <= 960) {
            setButton(false);
        } else {
            setButton(true);
        }

    };

    useEffect(() => {
        showButton();
    }, []);

    window.addEventListener('resize', showButton);

    return (
        <>
            <nav className="navbar">
                <div className="navbar-container">
                    <Link to="/" className="navbar-logo" onClick=
                    {closeMobileMenu}>
                        ♠ AceBook <i className='fab fa-typo3' />

                    </Link>    
                    <div className='menu-icon' onClick={handleClick}>
                        <i className={click ? 'fas fa-times': 'fas fa-bars'} />

                    </div>

                    <ul className={click ? 'nav-menu active': 'nav-menu'}>
                        <li className='nav-item'>
                            <Link to='/posts'className='nav-links' onClick={closeMobileMenu}>
                                Posts
                            </Link>
                        </li>
                        <li className='nav-item'>
                            <Link to='/sign-up'className='nav-links-mobile' onClick={closeMobileMenu}>
                                
                                Sign Up
                            </Link>
                        </li>

                        {/* <li className='nav-item'>
                            <Link to='/log-in'className='nav-links-mobile' onClick={closeMobileMenu}>
                                Log in
                            </Link>
                        </li> */}

                    </ul>
                    {button && <Button buttonStyle='btn--outline'>SIGN UP</Button>}
                    {button && <Button buttonStyle='btn--outline'>LOG IN</Button>}

                </div>
            </nav>

        </>
    )
}

export default Navbar
