function [] = molToMass()
    close all;
    global gui;
   
    %setting up the general format of the GUI
    %this includes the top instructions and some panels
        fig = figure('numbertitle','off','name','Mole to Mass Fraction Calculator', 'position', [340,193,921.6,528],'Color','#E4DDEA');
        panel = uipanel('position',  [0.03 0.89 0.93 0.09], 'BackgroundColor','#FFD9A5');
        instructions = uicontrol('style', 'text', 'units','normalized', 'position',  [0.05 0.90 0.90 0.06], 'string', 'Input the molar fractions of up to 8 components, ensuring that they add up to 1. Next input their molar masses. Type in zeros for any unused components. Once done, your mass fraction will display!', 'horizontalalignment','center','BackgroundColor','#FFD9A5');
        %gui.button = uicontrol('style','togglebutton','units','normalized','position',[0.436 0.05 0.13 0.08],'string','Calculate!','BackgroundColor','#FFD9A5');
        panel(5) = uipanel('position',  [0.018 0.02 0.10 0.05], 'BackgroundColor','#FFD9A5');
        basis = uicontrol('style','text','units','normalized','position',[0.023 0.034 0.09 0.02], 'string','Basis: 1 Mole', 'BackgroundColor','#FFD9A5','horizontalalignment','center');
        panelNotice = uipanel('position', [.806 .02 .18 0.11],'BackgroundColor','#FFD9A5');
        fractionHelp = uicontrol('Style','text','units','normalized','position', [0.81 .025 .17 .09], 'string', 'Divide percentage of component by 100 to get the fraction. Ex. 37% = 0.37 or 0.13 = 13%','BackgroundColor','#FFD9A5','horizontalalignment','center');
    %making the column of components, noneditable text box
    %generally, there will be less than 8 components, but just in case, 8
    %options are available
        panel(1) = uipanel('position', [.018 .155 .18 .70],'BackgroundColor','#FFDBFD');
        componentDisplayMessage = uicontrol('style','text','units','normalized','position', [0.04 0.73 0.13 0.08], 'string', 'Mixture Components','horizontalalignment','center','BackgroundColor','#FFDBFD');
            gui.component(1) = uicontrol('style','text','units','normalized','position', [0.055 0.69 0.1 0.04], 'string', 'A','horizontalalignment','center','BackgroundColor','#FFDBFD');
            gui.component(2) = uicontrol('style','text','units','normalized','position', [0.055 0.62 0.1 0.04], 'string', 'B','horizontalalignment','center','BackgroundColor','#FFDBFD');
            gui.component(3) = uicontrol('style','text','units','normalized','position', [0.055 0.55 0.1 0.04], 'string', 'C','horizontalalignment','center','BackgroundColor','#FFDBFD');
            gui.component(4) = uicontrol('style','text','units','normalized','position', [0.055 0.48 0.1 0.04], 'string', 'D','horizontalalignment','center','BackgroundColor','#FFDBFD');
            gui.component(5) = uicontrol('style','text','units','normalized','position', [0.055 0.41 0.1 0.04], 'string', 'E','horizontalalignment','center','BackgroundColor','#FFDBFD');
            gui.component(6) = uicontrol('style','text','units','normalized','position', [0.055 0.34 0.1 0.04], 'string', 'F','horizontalalignment','center','BackgroundColor','#FFDBFD');
            gui.component(7) = uicontrol('style','text','units','normalized','position', [0.055 0.27 0.1 0.04], 'string', 'G','horizontalalignment','center','BackgroundColor','#FFDBFD');
            gui.component(8) = uicontrol('style','text','units','normalized','position', [0.055 0.20 0.1 0.04], 'string', 'H','horizontalalignment','center','BackgroundColor','#FFDBFD');

    %making the column of molar fractions, editable boxes
    %set up is for the uneditable parts
        gui.zeros = 0.000;
            panel(2) = uipanel('position', [.215 .155 .18 .70],'BackgroundColor','#F1E0FF');
            moleFracDisplayMessage = uicontrol('style','text','units','normalized','position', [0.24 0.73 0.13 0.08], 'string', 'Molar Fractions','BackgroundColor','#F1E0FF');
            moleFracTotalDisplayMessage = uicontrol('style','text','Units','normalized','position', [0.22 0.16 0.03 0.03],'string','Total:','HorizontalAlignment','left','BackgroundColor','#F1E0FF');
            gui.moleFracSum = uicontrol('style','text','Units','normalized','position', [0.25 0.16 0.04 0.03],'string',num2str(gui.zeros),'HorizontalAlignment','left','BackgroundColor','#F1E0FF');
            %listing out and coloring, along with setting up the formatting
            %of each individual possible user input
            gui.moleFracStored = [0 0 0 0 0 0 0 0];
                gui.moleFrac(1) = uicontrol('style','edit','units','normalized','position', [0.265 0.70 0.08 0.04],'callback',{@moleFracTotal,1},'string','0.00');
                gui.moleFrac(2) = uicontrol('style','edit','units','normalized','position', [0.265 0.63 0.08 0.04],'callback',{@moleFracTotal,2},'string','0.00');
                gui.moleFrac(3) = uicontrol('style','edit','units','normalized','position', [0.265 0.56 0.08 0.04],'callback',{@moleFracTotal,3},'string','0.00');   
                gui.moleFrac(4) = uicontrol('style','edit','units','normalized','position', [0.265 0.49 0.08 0.04],'callback',{@moleFracTotal,4},'string','0.00');    
                gui.moleFrac(5) = uicontrol('style','edit','units','normalized','position', [0.265 0.42 0.08 0.04],'callback',{@moleFracTotal,5},'string','0.00');  
                gui.moleFrac(6) = uicontrol('style','edit','units','normalized','position', [0.265 0.35 0.08 0.04],'callback',{@moleFracTotal,6},'string','0.00');   
                gui.moleFrac(7) = uicontrol('style','edit','units','normalized','position', [0.265 0.28 0.08 0.04],'callback',{@moleFracTotal,7},'string','0.00');  
                gui.moleFrac(8) = uicontrol('style','edit','units','normalized','position', [0.265 0.21 0.08 0.04],'callback',{@moleFracTotal,8},'string','0.00');
    %making the column of molar masses, editable boxes
        gui.panel(3) = uipanel('position', [.412 .155 .18 .70],'BackgroundColor','#D9F4FF');
        gui.molarMassDisplayMessage = uicontrol('style','text','units','normalized','position', [0.436 0.73 0.13 0.08], 'string', 'Molar Mass (g / mol)','BackgroundColor','#D9F4FF');

 
            gui.moleMass(1) = uicontrol('style','edit','units','normalized','position', [0.461 0.70 0.08 0.04],'string','0.00','Callback',{@checkMolarMass,1});
            gui.moleMass(2) = uicontrol('style','edit','units','normalized','position', [0.461 0.63 0.08 0.04],'string','0.00','Callback',{@checkMolarMass,2});
            gui.moleMass(3) = uicontrol('style','edit','units','normalized','position', [0.461 0.56 0.08 0.04],'string','0.00','Callback',{@checkMolarMass,3});   
            gui.moleMass(4) = uicontrol('style','edit','units','normalized','position', [0.461 0.49 0.08 0.04],'string','0.00','Callback',{@checkMolarMass,4});   
            gui.moleMass(5) = uicontrol('style','edit','units','normalized','position', [0.461 0.42 0.08 0.04],'string','0.00','Callback',{@checkMolarMass,5});   
            gui.moleMass(6) = uicontrol('style','edit','units','normalized','position', [0.461 0.35 0.08 0.04],'string','0.00','Callback',{@checkMolarMass,6});   
            gui.moleMass(7) = uicontrol('style','edit','units','normalized','position', [0.461 0.28 0.08 0.04],'string','0.00','Callback',{@checkMolarMass,7});    
            gui.moleMass(8) = uicontrol('style','edit','units','normalized','position', [0.461 0.21 0.08 0.04],'string','0.00','Callback',{@checkMolarMass,8});
            
    %Column for calculated Masses and the Total Mass of the Mixture
        gui.massTotal = 0.000;
            gui.panel(3) = uipanel('position', [.609 .155 .18 .70],'BackgroundColor','#D9FFF3');
            gui.massDisplayMessage = uicontrol('style','text','units','normalized','position', [0.636 0.73 0.13 0.08], 'string', 'Mass (g)','BackgroundColor','#D9FFF3','HorizontalAlignment','center');
            gui.molarFracTotalDisplayMessage = uicontrol('style','text','Units','normalized','position', [0.616 0.16 0.03 0.03],'string','Total:','HorizontalAlignment','left','BackgroundColor','#D9FFF3');
    %Masses text boxes to be filled and massCalcSum function call to find
    %the masses from fraction and molar mass
            gui.massCalcSum = uicontrol('style','text','Units','normalized','position', [0.65 0.16 0.04 0.03],'string',num2str(gui.zeros),'HorizontalAlignment','left','BackgroundColor','#D9FFF3');    
                gui.mass(1) = uicontrol('style','text','units','normalized','position', [0.66 0.69 0.08 0.04], 'string', '~','horizontalalignment','center','BackgroundColor','#D9FFF3','Callback',{@massCalc,1});
                gui.mass(2) = uicontrol('style','text','units','normalized','position', [0.66 0.62 0.08 0.04], 'string', '~','horizontalalignment','center','BackgroundColor','#D9FFF3','Callback',{@massCalc,2});
                gui.mass(3) = uicontrol('style','text','units','normalized','position', [0.66 0.55 0.08 0.04], 'string', '~','horizontalalignment','center','BackgroundColor','#D9FFF3','Callback',{@massCalc,3});
                gui.mass(4) = uicontrol('style','text','units','normalized','position', [0.66 0.48 0.08 0.04], 'string', '~','horizontalalignment','center','BackgroundColor','#D9FFF3','Callback',{@massCalc,4});
                gui.mass(5) = uicontrol('style','text','units','normalized','position', [0.66 0.41 0.08 0.04], 'string', '~','horizontalalignment','center','BackgroundColor','#D9FFF3','Callback',{@massCalc,5});
                gui.mass(6) = uicontrol('style','text','units','normalized','position', [0.66 0.34 0.08 0.04], 'string', '~','horizontalalignment','center','BackgroundColor','#D9FFF3','Callback',{@massCalc,6});
                gui.mass(7) = uicontrol('style','text','units','normalized','position', [0.66 0.27 0.08 0.04], 'string', '~','horizontalalignment','center','BackgroundColor','#D9FFF3','Callback',{@massCalc,7});
                gui.mass(8) = uicontrol('style','text','units','normalized','position', [0.66 0.20 0.08 0.04], 'string', '~','horizontalalignment','center','BackgroundColor','#D9FFF3','Callback',{@massCalc,8});
 
    %Column for calculated Mass Fractions of Components
    %Will be displayed as a decimal
            panel(4) = uipanel('position', [.806 .155 .18 .70],'BackgroundColor','#FBFFD9');
            massDisplayMessage = uicontrol('style','text','units','normalized','position', [0.836 0.73 0.13 0.08], 'string', 'Mass Fraction','BackgroundColor','#FBFFD9','HorizontalAlignment','center');
                gui.massFrac(1) = uicontrol('style','text','units','normalized','position', [0.86 0.69 0.08 0.04], 'string', '~','horizontalalignment','center','BackgroundColor','#FBFFD9');
                gui.massFrac(2) = uicontrol('style','text','units','normalized','position', [0.86 0.62 0.08 0.04], 'string', '~','horizontalalignment','center','BackgroundColor','#FBFFD9');
                gui.massFrac(3) = uicontrol('style','text','units','normalized','position', [0.86 0.55 0.08 0.04], 'string', '~','horizontalalignment','center','BackgroundColor','#FBFFD9');
                gui.massFrac(4) = uicontrol('style','text','units','normalized','position', [0.86 0.48 0.08 0.04], 'string', '~','horizontalalignment','center','BackgroundColor','#FBFFD9');
                gui.massFrac(5) = uicontrol('style','text','units','normalized','position', [0.86 0.41 0.08 0.04], 'string', '~','horizontalalignment','center','BackgroundColor','#FBFFD9');
                gui.massFrac(6) = uicontrol('style','text','units','normalized','position', [0.86 0.34 0.08 0.04], 'string', '~','horizontalalignment','center','BackgroundColor','#FBFFD9');
                gui.massFrac(7) = uicontrol('style','text','units','normalized','position', [0.86 0.27 0.08 0.04], 'string', '~','horizontalalignment','center','BackgroundColor','#FBFFD9');
                gui.massFrac(8) = uicontrol('style','text','units','normalized','position', [0.86 0.20 0.08 0.04], 'string', '~','horizontalalignment','center','BackgroundColor','#FBFFD9');
    
end

%Sum of the mole fracitons and checking if it equals 1, if there are
%negatives, or other unintended formatting of user input
function [] = moleFracTotal(source,event,index)
    global gui
    gui.moleFracSum.String = '0.000';
    panel(6) = uipanel('position', [.215 .04 .18 .11],'BackgroundColor','#F1E0FF');

    for index = 1:8
        gui.moleFracSum.String = str2double(gui.moleFracSum.String) + str2double(gui.moleFrac(index).String);  
    end
    
    if str2double(gui.moleFracSum.String) ~= 1.00
        gui.errorMoleFrac = uicontrol('Style','text','String','Does not equal 1.00 or nonnumeric values inputted. Please fix.','Units','normalized','position', [0.22 0.05 0.17 0.08],'HorizontalAlignment','center','BackgroundColor','#F1E0FF');
    elseif str2double(gui.moleFracSum.String) == 1.00
        gui.errorMoleFrac = uicontrol('Style','text','String','Perfect! Proceed to the next column.','Units','normalized','position', [0.22 0.05 0.17 0.08],'HorizontalAlignment','center','BackgroundColor','#F1E0FF');
    end
    for index = 1:8
         if isnan(str2double(gui.moleFrac(index).String)) || str2double(gui.moleFrac(index).String) < 0
             msgbox('Input is either not a number or is negative. Please fix.','Calculation Error','error','modal')
         else
             continue
         end
    end
    for index = 1:8
        massCalc(0,0,index)
    end
end

%Checks molar mass for user error and formatting in order for calculations
%to be executed
function [] = checkMolarMass(source,event,index)
    global gui
    panel(7) = uipanel('position', [.412 .04 .18 .11],'BackgroundColor','#D9F4FF');
    for index = 1:8
        if isnan(str2double(gui.moleMass(index).String)) || str2double(gui.moleMass(index).String) < 0
            gui.errorMassList = uicontrol('Style','text','String','Input is not an acceptable number. Please change one or more of you boxes.','Units','normalized','position', [0.420 0.05 0.17 0.08],'HorizontalAlignment','center','BackgroundColor','#D9F4FF');
            break
        else
            gui.errorMassList = uicontrol('Style','text','String','Molar masses have been correctly listed!','Units','normalized','position', [0.420 0.05 0.17 0.08],'HorizontalAlignment','center','BackgroundColor','#D9F4FF');
        end
    end 
    for index = 1:8
        massCalc(0,0,index)
    end
    massSum(0,0)
end

%Will multiply the inputted Mass fraction with the inputted molar mass, Sum
%them, then find the mass fraction of each
function [] = massCalc(source,event,index)
    global gui
        if ~isnan(str2double((gui.moleMass(index).String))) && ~isnan(str2double((gui.moleFrac(index).String)))
            
            gui.mass(index).String = str2double(gui.moleMass(index).String) * str2double(gui.moleFrac(index).String);
         
        end


end 

%sums all of the masses calculated from massCalc function
function [] = massSum(source,event)
    global gui    
    gui.massCalcSum.String = '0.00';
        for index = 1:8
            gui.massCalcSum.String = str2double(gui.massCalcSum.String) + str2double(gui.mass(index).String);
        end 
    massFracFinal(0,0)

end

%divides the mass of each components by the total mass of all of the
%separate components
function [] = massFracFinal(source,event)
    global gui
    totalMass = str2double(gui.massCalcSum.String);
    for index = 1:8
        gui.massFrac(index).String = str2double(gui.mass(index).String) / totalMass;
    end
end


